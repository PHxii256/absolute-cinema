// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoucherData _$VoucherDataFromJson(Map<String, dynamic> json) => _VoucherData(
  claimed: json['claimed'] as bool,
  id: (_readVoucherId(json, 'id') as num).toInt(),
  isPerk: _readIsPerk(json, 'isPerk') as bool,
  perkMessage: _readPerkMessage(json, 'perkMessage') as String?,
  perkLimitation: _readPerkLimitation(json, 'perkLimitation') as String?,
  discountAmountType:
      _readDiscountAmountType(json, 'discountAmountType') as String,
  discountAmount: (_readDiscountAmount(json, 'discountAmount') as num).toInt(),
  discountLimitType:
      _readDiscountLimitType(json, 'discountLimitType') as String,
  discountLimitAmount:
      (_readDiscountLimitAmount(json, 'discountLimitAmount') as num).toInt(),
  theaterName: _readTheaterName(json, 'theaterName') as String?,
  validityDuration: _readvalidityDuration(json, 'validityDuration') as String?,
  minSeats: (_readMinSeats(json, 'minSeats') as num).toInt(),
  vipOnly: _readVipOnly(json, 'vipOnly') as bool,
  specificWeekDay: _readSpecificWeekDay(json, 'specificWeekDay') as String,
  specificDate: _readSpecificDate(json, 'specificDate') as String?,
  specificTimeStart:
      _readSpecificTimeStart(json, 'specificTimeStart') as String?,
  specificTimeEnd: _readSpecificTimeEnd(json, 'specificTimeEnd') as String?,
);

Map<String, dynamic> _$VoucherDataToJson(_VoucherData instance) =>
    <String, dynamic>{
      'claimed': instance.claimed,
      'id': instance.id,
      'isPerk': instance.isPerk,
      'perkMessage': instance.perkMessage,
      'perkLimitation': instance.perkLimitation,
      'discountAmountType': instance.discountAmountType,
      'discountAmount': instance.discountAmount,
      'discountLimitType': instance.discountLimitType,
      'discountLimitAmount': instance.discountLimitAmount,
      'theaterName': instance.theaterName,
      'validityDuration': instance.validityDuration,
      'minSeats': instance.minSeats,
      'vipOnly': instance.vipOnly,
      'specificWeekDay': instance.specificWeekDay,
      'specificDate': instance.specificDate,
      'specificTimeStart': instance.specificTimeStart,
      'specificTimeEnd': instance.specificTimeEnd,
    };
