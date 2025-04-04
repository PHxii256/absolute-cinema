import 'dart:math';

import 'package:flutter_application/features/reservation/model/seat_status_data.dart';
import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
part 'seat_status_notifier.g.dart';

@riverpod
class SeatStatus extends _$SeatStatus {
  @override
  Stream<List<SeatStatusData>> build(int screeningId) async* {
    yield* _getSeatStatusResults(screeningId);
  }

  Stream<List<SeatStatusData>> _getSeatStatusResults(int screeningId) async* {
    yield* Supabase.instance.client
        .from('reserved_seat')
        .stream(primaryKey: ['id'])
        .eq('screening_id', screeningId)
        .map<List<SeatStatusData>>((seatList) {
          List<SeatStatusData> reservedSeats = [];
          for (var seat in seatList) {
            reservedSeats.add(SeatStatusData.fromJson(seat));
          }
          return reservedSeats;
        });
  }

  Future<void> toggleReserveSeat(int screeningId, SeatData seatData) async {
    if (state.hasValue) {
      if (!seatBooked(seatData)) {
        final prevSeatStatusState = state;
        if (seatReserved(seatData)) {
          try {
            state = optimisticUnreserve(seatData, screeningId, state.value!);
            await deleteReservedSeat(seatData, screeningId);
            ref.invalidateSelf();
          } catch (err) {
            state = prevSeatStatusState;
          }
        } else {
          try {
            state = optimisticReserve(seatData, screeningId, state.value!);
            await insertReservedSeat(seatData, screeningId);
          } catch (err) {
            state = prevSeatStatusState;
          }
        }
      }
    }
  }

  Future<Map<String, dynamic>> _createBalanceRecord() async {
    try {
      return await Supabase.instance.client
          .from('user_balance')
          .insert({'user_id': Supabase.instance.client.auth.currentUser!.id, 'balance': 0})
          .select()
          .single();
    } catch (e) {
      return {};
    }
  }

  Future<int?> tryGetBalance() async {
    final response =
        await Supabase.instance.client
            .from('user_balance')
            .select('balance')
            .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
            .maybeSingle();

    if (response != null) {
      return response["balance"] as int;
    }
    return null;
  }

  //return error message or null if successful
  Future<String?> tryBookSeats(int screeningId) async {
    try {
      final currentBalance = await tryGetBalance();
      if (currentBalance != null) {
        return await _bookIfBalanceEnough(currentBalance);
      } else {
        await _createBalanceRecord();
        final currentBalance = await tryGetBalance();
        return await _bookIfBalanceEnough(currentBalance);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _bookIfBalanceEnough(int? currentBalance) async {
    if (currentBalance != null) {
      if (currentBalance < getTotalPrice()) {
        return "balance is not enough to book seats :/";
      }
      return _bookSeats(currentBalance);
    }
    return "balance not found";
  }

  Future<String?> _deduceBalance(int currentBalance, int amount) async {
    try {
      await Supabase.instance.client
          .from('user_balance')
          .update({'balance': currentBalance - amount})
          .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
          .maybeSingle();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _bookSeats(int currentBalance) async {
    try {
      await _deduceBalance(currentBalance, getTotalPrice());
      await _addTicket();
      await Supabase.instance.client
          .from('reserved_seat')
          .update({'booked': true})
          .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _addTicket() async {
    try {
      final pinCode = generatePIN();
      final qrId = generateQrId();
      await Supabase.instance.client.from('ticket').insert({
        'qr_id': qrId.toString(),
        'pin_code': pinCode,
        'user_id': Supabase.instance.client.auth.currentUser!.id,
      });
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateBalance(int amount) async {
    int? currentBalance = await tryGetBalance();

    if (currentBalance == null) {
      try {
        await _createBalanceRecord();
        currentBalance = await tryGetBalance();
      } catch (e) {
        return e.toString();
      }
    } else {
      try {
        await Supabase.instance.client
            .from('user_balance')
            .update({'balance': currentBalance + amount})
            .eq('user_id', Supabase.instance.client.auth.currentUser!.id)
            .maybeSingle();
        return null;
      } catch (e) {
        return e.toString();
      }
    }
    return null;
  }

  Future<void> deleteAllReservedSeats(int screeningId) async {
    await Supabase.instance.client
        .from('reserved_seat')
        .delete()
        .eq('screening_id', screeningId)
        .eq('booked', false)
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
  }

  Future<void> deleteReservedSeat(SeatData seatData, int screeningId) async {
    await Supabase.instance.client
        .from('reserved_seat')
        .delete()
        .eq('seat_no', seatData.seatNo)
        .eq('isle_code', seatData.isleID)
        .eq('screening_id', screeningId)
        .eq('booked', false)
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
  }

  Future<void> insertReservedSeat(SeatData seatData, int screeningId) async {
    try {
      final seatStatus = SeatStatusData(
        booked: false,
        price: seatData.price,
        isVip: seatData.isVip,
        reservedAt: DateTime.now(),
        isleCode: seatData.isleID,
        screeningId: screeningId,
        seatNumber: seatData.seatNo,
        userId: Supabase.instance.client.auth.currentUser!.id,
      );
      await Supabase.instance.client.from('reserved_seat').insert(seatStatus);
    } catch (e) {
      //print(e);
    }
  }

  AsyncValue<List<SeatStatusData>> optimisticReserve(
    SeatData seatData,
    int screeningId,
    List<SeatStatusData> currentSeats,
  ) {
    final seatStatus = SeatStatusData(
      booked: false,
      price: seatData.price,
      isVip: seatData.isVip,
      reservedAt: DateTime.now(),
      isleCode: seatData.isleID,
      screeningId: screeningId,
      seatNumber: seatData.seatNo,
      userId: Supabase.instance.client.auth.currentUser!.id,
    );
    return AsyncValue.data([...currentSeats, seatStatus]);
  }

  AsyncValue<List<SeatStatusData>> optimisticUnreserve(
    SeatData seatData,
    int screeningId,
    List<SeatStatusData> currentSeats,
  ) {
    final filteredSeats =
        currentSeats.where((seat) {
          final currentSeatId = getSeatId(seat.seatNumber, seat.isleCode);
          if (currentSeatId == getSeatId(seatData.seatNo, seatData.isleID)) {
            return false;
          }
          return true;
        }).toList();
    return AsyncValue.data(filteredSeats);
  }

  String getSeatId(int seatNum, String isleCode) => "${seatNum.toString()}$isleCode";

  SeatStatusData? getSeatStatus(SeatData seatData) {
    String seatId = getSeatId(seatData.seatNo, seatData.isleID);
    for (var element in state.value!) {
      if (seatId == getSeatId(element.seatNumber, element.isleCode)) return element;
    }
    return null;
  }

  bool seatReserved(SeatData seatData) {
    String seatId = getSeatId(seatData.seatNo, seatData.isleID);
    for (var element in state.value!) {
      if (seatId == getSeatId(element.seatNumber, element.isleCode)) return true;
    }
    return false;
  }

  bool seatBooked(SeatData seatData) {
    String seatId = getSeatId(seatData.seatNo, seatData.isleID);
    final bookedlist =
        state.value!.map((element) {
          if (element.booked) return element;
        }).toList();
    for (var element in bookedlist) {
      if (element != null) {
        if (seatId == getSeatId(element.seatNumber, element.isleCode)) return true;
      }
    }
    return false;
  }

  int getTotalPrice() {
    final nonBookedReservedSeats = state.value!.where((seat) => !seat.booked).toList();
    int runningTotal = 0;
    for (int i = 0; i < nonBookedReservedSeats.length; i++) {
      if (!nonBookedReservedSeats[i].booked) runningTotal += nonBookedReservedSeats[i].price;
    }
    return runningTotal;
  }

  String generateQrId() {
    var uuid = Uuid();
    return uuid.v4().toString();
  }

  int generatePIN() {
    Random random = Random();
    return random.nextInt(1000000);
    //String x = "${s.substring(0, 3)}-${s.substring(3, 6)}";
  }
}
