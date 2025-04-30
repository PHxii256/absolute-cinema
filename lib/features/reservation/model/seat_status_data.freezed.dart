// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat_status_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeatStatusData {

@JsonKey(name: 'reserved_at') DateTime get reservedAt;@JsonKey(name: 'screening_id') int get screeningId;@JsonKey(name: 'user_id') String? get userId;@JsonKey(name: 'isle_code') String get isleCode;@JsonKey(name: 'seat_no') int get seatNumber;@JsonKey(name: 'is_vip') bool get isVip; bool get booked; int get price;
/// Create a copy of SeatStatusData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatStatusDataCopyWith<SeatStatusData> get copyWith => _$SeatStatusDataCopyWithImpl<SeatStatusData>(this as SeatStatusData, _$identity);

  /// Serializes this SeatStatusData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeatStatusData&&(identical(other.reservedAt, reservedAt) || other.reservedAt == reservedAt)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode)&&(identical(other.seatNumber, seatNumber) || other.seatNumber == seatNumber)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.booked, booked) || other.booked == booked)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservedAt,screeningId,userId,isleCode,seatNumber,isVip,booked,price);

@override
String toString() {
  return 'SeatStatusData(reservedAt: $reservedAt, screeningId: $screeningId, userId: $userId, isleCode: $isleCode, seatNumber: $seatNumber, isVip: $isVip, booked: $booked, price: $price)';
}


}

/// @nodoc
abstract mixin class $SeatStatusDataCopyWith<$Res>  {
  factory $SeatStatusDataCopyWith(SeatStatusData value, $Res Function(SeatStatusData) _then) = _$SeatStatusDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'reserved_at') DateTime reservedAt,@JsonKey(name: 'screening_id') int screeningId,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'isle_code') String isleCode,@JsonKey(name: 'seat_no') int seatNumber,@JsonKey(name: 'is_vip') bool isVip, bool booked, int price
});




}
/// @nodoc
class _$SeatStatusDataCopyWithImpl<$Res>
    implements $SeatStatusDataCopyWith<$Res> {
  _$SeatStatusDataCopyWithImpl(this._self, this._then);

  final SeatStatusData _self;
  final $Res Function(SeatStatusData) _then;

/// Create a copy of SeatStatusData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservedAt = null,Object? screeningId = null,Object? userId = freezed,Object? isleCode = null,Object? seatNumber = null,Object? isVip = null,Object? booked = null,Object? price = null,}) {
  return _then(_self.copyWith(
reservedAt: null == reservedAt ? _self.reservedAt : reservedAt // ignore: cast_nullable_to_non_nullable
as DateTime,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,seatNumber: null == seatNumber ? _self.seatNumber : seatNumber // ignore: cast_nullable_to_non_nullable
as int,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SeatStatusData implements SeatStatusData {
  const _SeatStatusData({@JsonKey(name: 'reserved_at') required this.reservedAt, @JsonKey(name: 'screening_id') required this.screeningId, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'isle_code') required this.isleCode, @JsonKey(name: 'seat_no') required this.seatNumber, @JsonKey(name: 'is_vip') required this.isVip, required this.booked, required this.price});
  factory _SeatStatusData.fromJson(Map<String, dynamic> json) => _$SeatStatusDataFromJson(json);

@override@JsonKey(name: 'reserved_at') final  DateTime reservedAt;
@override@JsonKey(name: 'screening_id') final  int screeningId;
@override@JsonKey(name: 'user_id') final  String? userId;
@override@JsonKey(name: 'isle_code') final  String isleCode;
@override@JsonKey(name: 'seat_no') final  int seatNumber;
@override@JsonKey(name: 'is_vip') final  bool isVip;
@override final  bool booked;
@override final  int price;

/// Create a copy of SeatStatusData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatStatusDataCopyWith<_SeatStatusData> get copyWith => __$SeatStatusDataCopyWithImpl<_SeatStatusData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeatStatusDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeatStatusData&&(identical(other.reservedAt, reservedAt) || other.reservedAt == reservedAt)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode)&&(identical(other.seatNumber, seatNumber) || other.seatNumber == seatNumber)&&(identical(other.isVip, isVip) || other.isVip == isVip)&&(identical(other.booked, booked) || other.booked == booked)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservedAt,screeningId,userId,isleCode,seatNumber,isVip,booked,price);

@override
String toString() {
  return 'SeatStatusData(reservedAt: $reservedAt, screeningId: $screeningId, userId: $userId, isleCode: $isleCode, seatNumber: $seatNumber, isVip: $isVip, booked: $booked, price: $price)';
}


}

/// @nodoc
abstract mixin class _$SeatStatusDataCopyWith<$Res> implements $SeatStatusDataCopyWith<$Res> {
  factory _$SeatStatusDataCopyWith(_SeatStatusData value, $Res Function(_SeatStatusData) _then) = __$SeatStatusDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'reserved_at') DateTime reservedAt,@JsonKey(name: 'screening_id') int screeningId,@JsonKey(name: 'user_id') String? userId,@JsonKey(name: 'isle_code') String isleCode,@JsonKey(name: 'seat_no') int seatNumber,@JsonKey(name: 'is_vip') bool isVip, bool booked, int price
});




}
/// @nodoc
class __$SeatStatusDataCopyWithImpl<$Res>
    implements _$SeatStatusDataCopyWith<$Res> {
  __$SeatStatusDataCopyWithImpl(this._self, this._then);

  final _SeatStatusData _self;
  final $Res Function(_SeatStatusData) _then;

/// Create a copy of SeatStatusData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservedAt = null,Object? screeningId = null,Object? userId = freezed,Object? isleCode = null,Object? seatNumber = null,Object? isVip = null,Object? booked = null,Object? price = null,}) {
  return _then(_SeatStatusData(
reservedAt: null == reservedAt ? _self.reservedAt : reservedAt // ignore: cast_nullable_to_non_nullable
as DateTime,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,seatNumber: null == seatNumber ? _self.seatNumber : seatNumber // ignore: cast_nullable_to_non_nullable
as int,isVip: null == isVip ? _self.isVip : isVip // ignore: cast_nullable_to_non_nullable
as bool,booked: null == booked ? _self.booked : booked // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
