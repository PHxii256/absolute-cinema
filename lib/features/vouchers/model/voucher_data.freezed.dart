// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherData {

 bool get claimed;@JsonKey(readValue: _readVoucherId) int get id;@JsonKey(readValue: _readIsPerk) bool get isPerk;@JsonKey(readValue: _readPerkMessage) String? get perkMessage;@JsonKey(readValue: _readPerkLimitation) String? get perkLimitation;@JsonKey(readValue: _readDiscountAmountType) String get discountAmountType;@JsonKey(readValue: _readDiscountAmount) int get discountAmount;@JsonKey(readValue: _readDiscountLimitAmount) int get discountLimitAmount;@JsonKey(readValue: _readTheaterName) String? get theaterName;@JsonKey(readValue: _readvalidityDuration) int? get validityDuration;@JsonKey(readValue: _readMinSeats) int get minSeats;@JsonKey(readValue: _readVipOnly) bool get vipOnly;@JsonKey(readValue: _readSpecificWeekDay) String get specificWeekDay;@JsonKey(readValue: _readSpecificDate) String? get specificDate;@JsonKey(readValue: _readSpecificTimeStart) String? get specificTimeStart;@JsonKey(readValue: _readSpecificTimeEnd) String? get specificTimeEnd;
/// Create a copy of VoucherData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherDataCopyWith<VoucherData> get copyWith => _$VoucherDataCopyWithImpl<VoucherData>(this as VoucherData, _$identity);

  /// Serializes this VoucherData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherData&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPerk, isPerk) || other.isPerk == isPerk)&&(identical(other.perkMessage, perkMessage) || other.perkMessage == perkMessage)&&(identical(other.perkLimitation, perkLimitation) || other.perkLimitation == perkLimitation)&&(identical(other.discountAmountType, discountAmountType) || other.discountAmountType == discountAmountType)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountLimitAmount, discountLimitAmount) || other.discountLimitAmount == discountLimitAmount)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.validityDuration, validityDuration) || other.validityDuration == validityDuration)&&(identical(other.minSeats, minSeats) || other.minSeats == minSeats)&&(identical(other.vipOnly, vipOnly) || other.vipOnly == vipOnly)&&(identical(other.specificWeekDay, specificWeekDay) || other.specificWeekDay == specificWeekDay)&&(identical(other.specificDate, specificDate) || other.specificDate == specificDate)&&(identical(other.specificTimeStart, specificTimeStart) || other.specificTimeStart == specificTimeStart)&&(identical(other.specificTimeEnd, specificTimeEnd) || other.specificTimeEnd == specificTimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,claimed,id,isPerk,perkMessage,perkLimitation,discountAmountType,discountAmount,discountLimitAmount,theaterName,validityDuration,minSeats,vipOnly,specificWeekDay,specificDate,specificTimeStart,specificTimeEnd);

@override
String toString() {
  return 'VoucherData(claimed: $claimed, id: $id, isPerk: $isPerk, perkMessage: $perkMessage, perkLimitation: $perkLimitation, discountAmountType: $discountAmountType, discountAmount: $discountAmount, discountLimitAmount: $discountLimitAmount, theaterName: $theaterName, validityDuration: $validityDuration, minSeats: $minSeats, vipOnly: $vipOnly, specificWeekDay: $specificWeekDay, specificDate: $specificDate, specificTimeStart: $specificTimeStart, specificTimeEnd: $specificTimeEnd)';
}


}

/// @nodoc
abstract mixin class $VoucherDataCopyWith<$Res>  {
  factory $VoucherDataCopyWith(VoucherData value, $Res Function(VoucherData) _then) = _$VoucherDataCopyWithImpl;
@useResult
$Res call({
 bool claimed,@JsonKey(readValue: _readVoucherId) int id,@JsonKey(readValue: _readIsPerk) bool isPerk,@JsonKey(readValue: _readPerkMessage) String? perkMessage,@JsonKey(readValue: _readPerkLimitation) String? perkLimitation,@JsonKey(readValue: _readDiscountAmountType) String discountAmountType,@JsonKey(readValue: _readDiscountAmount) int discountAmount,@JsonKey(readValue: _readDiscountLimitAmount) int discountLimitAmount,@JsonKey(readValue: _readTheaterName) String? theaterName,@JsonKey(readValue: _readvalidityDuration) int? validityDuration,@JsonKey(readValue: _readMinSeats) int minSeats,@JsonKey(readValue: _readVipOnly) bool vipOnly,@JsonKey(readValue: _readSpecificWeekDay) String specificWeekDay,@JsonKey(readValue: _readSpecificDate) String? specificDate,@JsonKey(readValue: _readSpecificTimeStart) String? specificTimeStart,@JsonKey(readValue: _readSpecificTimeEnd) String? specificTimeEnd
});




}
/// @nodoc
class _$VoucherDataCopyWithImpl<$Res>
    implements $VoucherDataCopyWith<$Res> {
  _$VoucherDataCopyWithImpl(this._self, this._then);

  final VoucherData _self;
  final $Res Function(VoucherData) _then;

/// Create a copy of VoucherData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? claimed = null,Object? id = null,Object? isPerk = null,Object? perkMessage = freezed,Object? perkLimitation = freezed,Object? discountAmountType = null,Object? discountAmount = null,Object? discountLimitAmount = null,Object? theaterName = freezed,Object? validityDuration = freezed,Object? minSeats = null,Object? vipOnly = null,Object? specificWeekDay = null,Object? specificDate = freezed,Object? specificTimeStart = freezed,Object? specificTimeEnd = freezed,}) {
  return _then(_self.copyWith(
claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPerk: null == isPerk ? _self.isPerk : isPerk // ignore: cast_nullable_to_non_nullable
as bool,perkMessage: freezed == perkMessage ? _self.perkMessage : perkMessage // ignore: cast_nullable_to_non_nullable
as String?,perkLimitation: freezed == perkLimitation ? _self.perkLimitation : perkLimitation // ignore: cast_nullable_to_non_nullable
as String?,discountAmountType: null == discountAmountType ? _self.discountAmountType : discountAmountType // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,discountLimitAmount: null == discountLimitAmount ? _self.discountLimitAmount : discountLimitAmount // ignore: cast_nullable_to_non_nullable
as int,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,validityDuration: freezed == validityDuration ? _self.validityDuration : validityDuration // ignore: cast_nullable_to_non_nullable
as int?,minSeats: null == minSeats ? _self.minSeats : minSeats // ignore: cast_nullable_to_non_nullable
as int,vipOnly: null == vipOnly ? _self.vipOnly : vipOnly // ignore: cast_nullable_to_non_nullable
as bool,specificWeekDay: null == specificWeekDay ? _self.specificWeekDay : specificWeekDay // ignore: cast_nullable_to_non_nullable
as String,specificDate: freezed == specificDate ? _self.specificDate : specificDate // ignore: cast_nullable_to_non_nullable
as String?,specificTimeStart: freezed == specificTimeStart ? _self.specificTimeStart : specificTimeStart // ignore: cast_nullable_to_non_nullable
as String?,specificTimeEnd: freezed == specificTimeEnd ? _self.specificTimeEnd : specificTimeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VoucherData implements VoucherData {
  const _VoucherData({required this.claimed, @JsonKey(readValue: _readVoucherId) required this.id, @JsonKey(readValue: _readIsPerk) required this.isPerk, @JsonKey(readValue: _readPerkMessage) this.perkMessage, @JsonKey(readValue: _readPerkLimitation) this.perkLimitation, @JsonKey(readValue: _readDiscountAmountType) required this.discountAmountType, @JsonKey(readValue: _readDiscountAmount) required this.discountAmount, @JsonKey(readValue: _readDiscountLimitAmount) required this.discountLimitAmount, @JsonKey(readValue: _readTheaterName) this.theaterName, @JsonKey(readValue: _readvalidityDuration) this.validityDuration, @JsonKey(readValue: _readMinSeats) required this.minSeats, @JsonKey(readValue: _readVipOnly) required this.vipOnly, @JsonKey(readValue: _readSpecificWeekDay) required this.specificWeekDay, @JsonKey(readValue: _readSpecificDate) this.specificDate, @JsonKey(readValue: _readSpecificTimeStart) this.specificTimeStart, @JsonKey(readValue: _readSpecificTimeEnd) this.specificTimeEnd});
  factory _VoucherData.fromJson(Map<String, dynamic> json) => _$VoucherDataFromJson(json);

@override final  bool claimed;
@override@JsonKey(readValue: _readVoucherId) final  int id;
@override@JsonKey(readValue: _readIsPerk) final  bool isPerk;
@override@JsonKey(readValue: _readPerkMessage) final  String? perkMessage;
@override@JsonKey(readValue: _readPerkLimitation) final  String? perkLimitation;
@override@JsonKey(readValue: _readDiscountAmountType) final  String discountAmountType;
@override@JsonKey(readValue: _readDiscountAmount) final  int discountAmount;
@override@JsonKey(readValue: _readDiscountLimitAmount) final  int discountLimitAmount;
@override@JsonKey(readValue: _readTheaterName) final  String? theaterName;
@override@JsonKey(readValue: _readvalidityDuration) final  int? validityDuration;
@override@JsonKey(readValue: _readMinSeats) final  int minSeats;
@override@JsonKey(readValue: _readVipOnly) final  bool vipOnly;
@override@JsonKey(readValue: _readSpecificWeekDay) final  String specificWeekDay;
@override@JsonKey(readValue: _readSpecificDate) final  String? specificDate;
@override@JsonKey(readValue: _readSpecificTimeStart) final  String? specificTimeStart;
@override@JsonKey(readValue: _readSpecificTimeEnd) final  String? specificTimeEnd;

/// Create a copy of VoucherData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherDataCopyWith<_VoucherData> get copyWith => __$VoucherDataCopyWithImpl<_VoucherData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherData&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.id, id) || other.id == id)&&(identical(other.isPerk, isPerk) || other.isPerk == isPerk)&&(identical(other.perkMessage, perkMessage) || other.perkMessage == perkMessage)&&(identical(other.perkLimitation, perkLimitation) || other.perkLimitation == perkLimitation)&&(identical(other.discountAmountType, discountAmountType) || other.discountAmountType == discountAmountType)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountLimitAmount, discountLimitAmount) || other.discountLimitAmount == discountLimitAmount)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.validityDuration, validityDuration) || other.validityDuration == validityDuration)&&(identical(other.minSeats, minSeats) || other.minSeats == minSeats)&&(identical(other.vipOnly, vipOnly) || other.vipOnly == vipOnly)&&(identical(other.specificWeekDay, specificWeekDay) || other.specificWeekDay == specificWeekDay)&&(identical(other.specificDate, specificDate) || other.specificDate == specificDate)&&(identical(other.specificTimeStart, specificTimeStart) || other.specificTimeStart == specificTimeStart)&&(identical(other.specificTimeEnd, specificTimeEnd) || other.specificTimeEnd == specificTimeEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,claimed,id,isPerk,perkMessage,perkLimitation,discountAmountType,discountAmount,discountLimitAmount,theaterName,validityDuration,minSeats,vipOnly,specificWeekDay,specificDate,specificTimeStart,specificTimeEnd);

@override
String toString() {
  return 'VoucherData(claimed: $claimed, id: $id, isPerk: $isPerk, perkMessage: $perkMessage, perkLimitation: $perkLimitation, discountAmountType: $discountAmountType, discountAmount: $discountAmount, discountLimitAmount: $discountLimitAmount, theaterName: $theaterName, validityDuration: $validityDuration, minSeats: $minSeats, vipOnly: $vipOnly, specificWeekDay: $specificWeekDay, specificDate: $specificDate, specificTimeStart: $specificTimeStart, specificTimeEnd: $specificTimeEnd)';
}


}

/// @nodoc
abstract mixin class _$VoucherDataCopyWith<$Res> implements $VoucherDataCopyWith<$Res> {
  factory _$VoucherDataCopyWith(_VoucherData value, $Res Function(_VoucherData) _then) = __$VoucherDataCopyWithImpl;
@override @useResult
$Res call({
 bool claimed,@JsonKey(readValue: _readVoucherId) int id,@JsonKey(readValue: _readIsPerk) bool isPerk,@JsonKey(readValue: _readPerkMessage) String? perkMessage,@JsonKey(readValue: _readPerkLimitation) String? perkLimitation,@JsonKey(readValue: _readDiscountAmountType) String discountAmountType,@JsonKey(readValue: _readDiscountAmount) int discountAmount,@JsonKey(readValue: _readDiscountLimitAmount) int discountLimitAmount,@JsonKey(readValue: _readTheaterName) String? theaterName,@JsonKey(readValue: _readvalidityDuration) int? validityDuration,@JsonKey(readValue: _readMinSeats) int minSeats,@JsonKey(readValue: _readVipOnly) bool vipOnly,@JsonKey(readValue: _readSpecificWeekDay) String specificWeekDay,@JsonKey(readValue: _readSpecificDate) String? specificDate,@JsonKey(readValue: _readSpecificTimeStart) String? specificTimeStart,@JsonKey(readValue: _readSpecificTimeEnd) String? specificTimeEnd
});




}
/// @nodoc
class __$VoucherDataCopyWithImpl<$Res>
    implements _$VoucherDataCopyWith<$Res> {
  __$VoucherDataCopyWithImpl(this._self, this._then);

  final _VoucherData _self;
  final $Res Function(_VoucherData) _then;

/// Create a copy of VoucherData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? claimed = null,Object? id = null,Object? isPerk = null,Object? perkMessage = freezed,Object? perkLimitation = freezed,Object? discountAmountType = null,Object? discountAmount = null,Object? discountLimitAmount = null,Object? theaterName = freezed,Object? validityDuration = freezed,Object? minSeats = null,Object? vipOnly = null,Object? specificWeekDay = null,Object? specificDate = freezed,Object? specificTimeStart = freezed,Object? specificTimeEnd = freezed,}) {
  return _then(_VoucherData(
claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,isPerk: null == isPerk ? _self.isPerk : isPerk // ignore: cast_nullable_to_non_nullable
as bool,perkMessage: freezed == perkMessage ? _self.perkMessage : perkMessage // ignore: cast_nullable_to_non_nullable
as String?,perkLimitation: freezed == perkLimitation ? _self.perkLimitation : perkLimitation // ignore: cast_nullable_to_non_nullable
as String?,discountAmountType: null == discountAmountType ? _self.discountAmountType : discountAmountType // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int,discountLimitAmount: null == discountLimitAmount ? _self.discountLimitAmount : discountLimitAmount // ignore: cast_nullable_to_non_nullable
as int,theaterName: freezed == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String?,validityDuration: freezed == validityDuration ? _self.validityDuration : validityDuration // ignore: cast_nullable_to_non_nullable
as int?,minSeats: null == minSeats ? _self.minSeats : minSeats // ignore: cast_nullable_to_non_nullable
as int,vipOnly: null == vipOnly ? _self.vipOnly : vipOnly // ignore: cast_nullable_to_non_nullable
as bool,specificWeekDay: null == specificWeekDay ? _self.specificWeekDay : specificWeekDay // ignore: cast_nullable_to_non_nullable
as String,specificDate: freezed == specificDate ? _self.specificDate : specificDate // ignore: cast_nullable_to_non_nullable
as String?,specificTimeStart: freezed == specificTimeStart ? _self.specificTimeStart : specificTimeStart // ignore: cast_nullable_to_non_nullable
as String?,specificTimeEnd: freezed == specificTimeEnd ? _self.specificTimeEnd : specificTimeEnd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
