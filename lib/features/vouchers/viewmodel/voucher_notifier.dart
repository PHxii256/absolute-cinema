import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_application/features/reservation/viewmodel/seat_status_notifier.dart';
import 'package:flutter_application/features/vouchers/model/voucher_data.dart';
import 'package:flutter_application/features/vouchers/viewmodel/applied_voucher.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'voucher_notifier.g.dart';

@riverpod
class VoucherNotifier extends _$VoucherNotifier {
  @override
  Future<List<VoucherData>> build() async {
    return await _getVouchers();
  }

  Future<List<VoucherData>> _getVouchers() async {
    List<VoucherData> voucherResults = [];

    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('user_voucher')
        .select('claimed, voucher(*, theater(name))')
        .eq('user_id', Supabase.instance.client.auth.currentUser!.id);
    for (var result in dbResultList) {
      VoucherData data = VoucherData.fromJson(result);
      voucherResults.add(data);
    }
    return voucherResults;
  }

  List<VoucherData> getActiveVouchers() {
    if (!state.hasValue) return [];
    return state.value!.where((voucher) => isVoucherActive(voucher)).toList();
  }

  bool isVoucherActive(VoucherData voucher) {
    return voucher.claimed || voucher.isPerk || isVoucherExpired(voucher) ? false : true;
  }

  bool isVoucherExpired(VoucherData voucher) {
    if (voucher.validityDuration != null) {
      if (DateTime.now().day + voucher.validityDuration! > DateTime.now().day) return false;
      return true;
    }
    return false;
  }

  Future<String?> addPromoCode(String code) async {
    try {
      final res = await Supabase.instance.client.from("voucher").select("id").eq("promo_code", code);
      if (res.isEmpty) return "Error: Promo code is either invalid or incorrect";
      final voucherId = res.first["id"] as int;
      final res2 = await Supabase.instance.client
          .from("user_voucher")
          .select("user_id, voucher_id")
          .eq("user_id", Supabase.instance.client.auth.currentUser!.id)
          .eq("voucher_id", voucherId)
          .limit(1);

      if (res2.isNotEmpty) return "Error: Promo code already activated";

      final resVoucher = await Supabase.instance.client
          .from("user_voucher")
          .insert({"user_id": Supabase.instance.client.auth.currentUser!.id, "voucher_id": voucherId, "claimed": false})
          .select('claimed, voucher(*, theater(name))')
          .limit(1);

      VoucherData data = VoucherData.fromJson(resVoucher.first);

      if (state.hasValue) {
        state = AsyncData([...state.value!, data]);
      }
    } catch (e) {
      return e.toString();
    }

    return null;
  }

  getPriceAfterDiscount(int preDiscountPrice) {
    final voucher = ref.read(appliedVoucherProvider);
    if (voucher == null) return preDiscountPrice;
    if (voucher.discountAmountType == "Absolute") {
      return max(0, preDiscountPrice - voucher.discountAmount);
    }
    if (voucher.discountAmountType == "Percentage") {
      final double p = voucher.discountAmount / 100;
      if (voucher.discountLimitAmount == 0) {
        return max(0, (preDiscountPrice - p * preDiscountPrice).floor()); //no limit check
      } else {
        final discountAmount = (p * preDiscountPrice);
        return clampDouble(discountAmount, 0, voucher.discountLimitAmount.toDouble()).floor();
      }
    }
  }

  //used to throw an error snackbar to notify the user what they need to do for the voucher to apply
  String validateVoucher(VoucherData data, int screeningId, DateTime screeningTimestamp) {
    final selectedSeats = ref.read(seatStatusProvider(screeningId).notifier).getNonBookedReservedSeats();

    if (data.minSeats > 1) {
      if (data.minSeats > selectedSeats.length) {
        return "Voucher not applied, You need to reserve at least ${data.minSeats} for voucher to apply";
      }
    }

    if (data.vipOnly) {
      if (selectedSeats.where((seat) => seat.isVip ? true : false).length != selectedSeats.length) {
        return "Voucher not applied, All reserved seats must be VIP seats for voucher to apply";
      }
    }

    final specificDayErr = _checkSpecificDay(data, screeningTimestamp);
    if (specificDayErr != "") return specificDayErr;

    final weekdayErr = _checkWeekday(data, screeningTimestamp);
    if (weekdayErr != "") return weekdayErr;

    final timeErr = _checkTime(data, screeningTimestamp);
    if (timeErr != "") return timeErr;

    return "";
  }

  String _checkSpecificDay(VoucherData data, DateTime screeningTimestamp) {
    if (data.specificDate != null) {
      final d = DateTime.parse(data.specificDate!);
      if (DateTime.parse(data.specificDate!).day != screeningTimestamp.day) {
        return "Voucher not applied, it must be ${DateFormat('MMMMd').format(d)}${getDayOfMonthSuffix(d.day)}} for voucher to apply";
      }
    }
    return "";
  }

  String _checkWeekday(VoucherData data, DateTime screeningTimestamp) {
    if (data.specificWeekDay != "All") {
      final currentDay = DateFormat.EEEE().format(screeningTimestamp);
      final errorMsg = "Voucher not applied, it must be a $currentDay for voucher to apply";

      if (data.specificWeekDay != currentDay) {
        if (data.specificWeekDay == "Weekend" && !["Friday", "Saturday"].contains(currentDay)) {
          return errorMsg;
        } else if (data.specificWeekDay == "Weekday" && ["Friday", "Saturday"].contains(currentDay)) {
          return errorMsg;
        }
      }
    }
    return "";
  }

  String _checkTime(VoucherData data, DateTime screeningTimestamp) {
    if (data.specificTimeStart != null && data.specificTimeEnd != null) {
      final start = screeningTimestamp.copyWith(
        hour: int.parse(data.specificTimeStart!.substring(0, 2)),
        minute: int.parse(data.specificTimeStart!.substring(3, 5)),
      );
      final end = screeningTimestamp.copyWith(
        hour: int.parse(data.specificTimeEnd!.substring(0, 2)),
        minute: int.parse(data.specificTimeEnd!.substring(3, 5)),
      );

      if (screeningTimestamp.isBefore(start) || screeningTimestamp.isAfter(end)) {
        return "Voucher not applied, Movie screening must be between ${get12HourFormat(data.specificTimeStart)} and ${get12HourFormat(data.specificTimeEnd)} for voucher to apply";
      }
    }
    if (data.specificTimeStart != null) {
      final start = screeningTimestamp.copyWith(
        hour: int.parse(data.specificTimeStart!.substring(0, 2)),
        minute: int.parse(data.specificTimeStart!.substring(3, 5)),
      );

      if (screeningTimestamp.isBefore(start)) {
        return "Voucher not applied, Movie screening must be later than ${get12HourFormat(data.specificTimeStart)} for voucher to apply";
      }
    }
    if (data.specificTimeEnd != null) {
      final end = screeningTimestamp.copyWith(
        hour: int.parse(data.specificTimeEnd!.substring(0, 2)),
        minute: int.parse(data.specificTimeEnd!.substring(3, 5)),
      );
      if (screeningTimestamp.isAfter(end)) {
        return "Voucher not applied, Movie screening must be later than ${get12HourFormat(data.specificTimeEnd)} for voucher to apply";
      }
    }

    return "";
  }

  String headingText(VoucherData data) {
    String text = "(${data.theaterName ?? "All Partnered Cinemas"}) ";
    text += _voucherText(data);
    return text;
  }

  String subText(VoucherData data) {
    if (data.isPerk) return "${data.perkLimitation}";
    return _parseDiscountLimitation(data);
  }

  String termsAndConditions(VoucherData data) {
    String limitationText = "";
    final String wrapSymbol = "-";
    final String delim = "·";
    limitationText +=
        data.discountLimitAmount > 0 ? "$wrapSymbol Max discount ${data.discountLimitAmount} EGP $delim " : "";
    limitationText += data.vipOnly ? "on vip seats only $delim " : "";
    limitationText += data.minSeats > 1 ? "minimum seats: ${data.minSeats} " : "";
    return limitationText == "" ? "" : limitationText += wrapSymbol;
  }

  String _voucherText(VoucherData data) {
    if (data.isPerk) return "${data.perkMessage}";
    return parseDiscount(data);
  }

  String parseDiscount(VoucherData data) {
    if (data.discountAmountType == "Absolute") {
      return "${data.discountAmount} EGP off any movie";
    } else {
      return "${data.discountAmount}% off any movie";
    }
  }

  String _parseDiscountLimitation(VoucherData data) {
    String limitationText = "";
    final String delim = " · ";

    if (data.specificWeekDay != "All") {
      limitationText += "Only on ${data.specificWeekDay}s";
    }
    if (data.specificTimeStart != null && data.specificTimeEnd != null) {
      limitationText += "From ${get12HourFormat(data.specificTimeStart!)} To ${get12HourFormat(data.specificTimeEnd!)}";
    } else {
      limitationText +=
          data.specificTimeStart != null
              ? "Starting From ${get12HourFormat(data.specificTimeStart!)}"
              : "Until ${get12HourFormat(data.specificTimeEnd!)}";
    }

    limitationText += delim;

    limitationText += _getValidityText(data);

    return limitationText;
  }

  String _getValidityText(VoucherData data) {
    String s = "";
    if (data.specificDate != null) {
      final d = DateTime.tryParse(data.specificDate!);
      if (d != null) {
        s = "Valid on ${DateFormat('MMMMd').format(d)}${getDayOfMonthSuffix(d.day)}";
      }
    } else {
      if (data.validityDuration != null) {
        DateTime d = DateTime.now().add(Duration(days: data.validityDuration!));
        s = "Valid till ${DateFormat('MMMMd').format(d)}${getDayOfMonthSuffix(d.day)}";
      } else {
        s = "Valid Forever";
      }
    }
    return s;
  }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String get12HourFormat(String? s) {
    if (s == null) return "";
    final h = int.parse(s.substring(0, 2));
    final m = int.parse(s.substring(3, 5));
    if (m == 0) return h >= 12 ? "${h - 12} PM" : "$h AM";
    return h >= 12 ? "$h:$m PM" : "$h AM";
  }
}
