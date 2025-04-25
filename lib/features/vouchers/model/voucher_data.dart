import 'package:freezed_annotation/freezed_annotation.dart';
part 'voucher_data.freezed.dart';
part 'voucher_data.g.dart';

String? _readTheaterName(Map json, _) {
  if (json["voucher"]["theater"] == null) return null;
  return json["voucher"]["theater"]["name"] as String?;
}

int _readVoucherId(Map json, _) => json["voucher"]["id"];
bool _readIsPerk(Map json, _) => json["voucher"]["is_perk"];
String? _readPerkMessage(Map json, _) => json["voucher"]["perk_message"];
String? _readPerkLimitation(Map json, _) => json["voucher"]["perk_limitation"];
String _readDiscountAmountType(Map json, _) => json["voucher"]["discount_amount_type"];
int _readDiscountAmount(Map json, _) => json["voucher"]["discount_amount"];
int _readDiscountLimitAmount(Map json, _) => json["voucher"]["discount_limit_amount"];
int? _readvalidityDuration(Map json, _) => json["voucher"]["validity_duration"];
int _readMinSeats(Map json, _) => json["voucher"]["min_seats"];
bool _readVipOnly(Map json, _) => json["voucher"]["vip_only"];
String _readSpecificWeekDay(Map json, _) => json["voucher"]["specific_week_day"];
String? _readSpecificDate(Map json, _) => json["voucher"]["specific_date"];
String? _readSpecificTimeStart(Map json, _) => json["voucher"]["specific_time_start"];
String? _readSpecificTimeEnd(Map json, _) => json["voucher"]["specific_time_end"];

@freezed
abstract class VoucherData with _$VoucherData {
  const factory VoucherData({
    required bool claimed,
    @JsonKey(readValue: _readVoucherId) required int id,
    @JsonKey(readValue: _readIsPerk) required bool isPerk,
    @JsonKey(readValue: _readPerkMessage) String? perkMessage,
    @JsonKey(readValue: _readPerkLimitation) String? perkLimitation,
    @JsonKey(readValue: _readDiscountAmountType) required String discountAmountType,
    @JsonKey(readValue: _readDiscountAmount) required int discountAmount,
    @JsonKey(readValue: _readDiscountLimitAmount) required int discountLimitAmount,
    @JsonKey(readValue: _readTheaterName) String? theaterName,
    @JsonKey(readValue: _readvalidityDuration) int? validityDuration,
    @JsonKey(readValue: _readMinSeats) required int minSeats,
    @JsonKey(readValue: _readVipOnly) required bool vipOnly,
    @JsonKey(readValue: _readSpecificWeekDay) required String specificWeekDay,
    @JsonKey(readValue: _readSpecificDate) String? specificDate,
    @JsonKey(readValue: _readSpecificTimeStart) String? specificTimeStart,
    @JsonKey(readValue: _readSpecificTimeEnd) String? specificTimeEnd,
  }) = _VoucherData;

  factory VoucherData.fromJson(Map<String, Object?> json) => _$VoucherDataFromJson(json);
}
