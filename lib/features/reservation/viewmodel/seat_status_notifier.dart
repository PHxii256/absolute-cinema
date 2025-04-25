import 'dart:developer' as dev;
import 'dart:math';
import 'package:flutter_application/features/reservation/model/seat_status_data.dart';
import 'package:flutter_application/features/reservation/model/theater_model.dart';
import 'package:flutter_application/features/vouchers/viewmodel/applied_voucher.dart';
import 'package:flutter_application/features/vouchers/viewmodel/voucher_notifier.dart';
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
        if (seatReservedByCurrentUser(seatData)) {
          try {
            state = optimisticUnreserve(seatData, screeningId, state.value!);
            await deleteReservedSeat(seatData, screeningId);
          } catch (err) {
            state = prevSeatStatusState;
          }
        } else if (!seatReserved(seatData)) {
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
        return await _bookIfBalanceEnough(currentBalance, screeningId);
      } else {
        await _createBalanceRecord();
        final currentBalance = await tryGetBalance();
        return await _bookIfBalanceEnough(currentBalance, screeningId);
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _bookIfBalanceEnough(int? currentBalance, int screeningId) async {
    if (currentBalance != null) {
      final total = getTotalPrice();
      if (currentBalance < total) {
        return "balance is not enough to book seats :/";
      }
      return _bookSeats(currentBalance, screeningId);
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

  Future<String?> _bookSeats(int currentBalance, int screeningId) async {
    try {
      final total = getTotalPrice();
      await _deduceBalance(currentBalance, total);
      await _consumeVoucher();
      await _addTicket(screeningId);
      await Supabase.instance.client
          .from('reserved_seat')
          .update({'booked': true})
          .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _addTicket(int screeningId) async {
    try {
      final pinCode = generatePIN();
      final qrId = generateQrId();
      await Supabase.instance.client.from('ticket').upsert({
        'qr_id': qrId.toString(),
        'pin_code': pinCode,
        'user_id': Supabase.instance.client.auth.currentUser!.id,
        'movie_screening_id': screeningId,
      });
    } catch (e) {
      dev.log(e.toString());
      return e.toString();
    }
    return null;
  }

  Future<String?> _consumeVoucher() async {
    final voucher = ref.read(appliedVoucherProvider);
    if (voucher == null) return null;
    try {
      await Supabase.instance.client
          .from("user_voucher")
          .update({"claimed": true})
          .eq("user_id", Supabase.instance.client.auth.currentUser!.id)
          .eq("voucher_id", voucher.id);
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

  bool seatReservedByCurrentUser(SeatData seatData) {
    String seatId = getSeatId(seatData.seatNo, seatData.isleID);

    for (var element in state.value!) {
      if (seatId == getSeatId(element.seatNumber, element.isleCode) &&
          Supabase.instance.client.auth.currentUser!.id == element.userId) {
        return true;
      }
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

  List<SeatStatusData> getNonBookedReservedSeats() {
    return state.value!.where((seat) {
      return !seat.booked && seat.userId == Supabase.instance.client.auth.currentUser!.id;
    }).toList();
  }

  int getSubtotalPrice() {
    final nbrs = getNonBookedReservedSeats();
    int runningTotal = 0;
    for (int i = 0; i < nbrs.length; i++) {
      if (!nbrs[i].booked) runningTotal += nbrs[i].price;
    }
    return runningTotal;
  }

  int getTotalPrice() {
    return ref.read(voucherNotifierProvider.notifier).getPriceAfterDiscount(getSubtotalPrice());
  }

  String generateQrId() {
    var uuid = Uuid();
    return uuid.v4().toString();
  }

  int generatePIN() {
    Random random = Random();
    return random.nextInt(1000000);
  }
}
