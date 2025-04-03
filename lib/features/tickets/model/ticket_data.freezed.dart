// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TicketData {

@JsonKey(name: 'ticket_qr_id') String get qrId;@JsonKey(name: 'ticket_pin_code') int get pinCode;@JsonKey(name: 'theater_name') String get theaterName;@JsonKey(name: 'movie_name') String get movieName;@JsonKey(name: 'hall_name') String get hallName;@JsonKey(name: 'movie_airing_time') DateTime get airingTimestamp;@JsonKey(name: 'movie_screening_id') int get screeningId;@JsonKey(name: 'isle_code') String get isleCode;@JsonKey(name: 'seat_no') int get seatNumber;@JsonKey(name: 'seat_price') int get seatPrice;
/// Create a copy of TicketData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDataCopyWith<TicketData> get copyWith => _$TicketDataCopyWithImpl<TicketData>(this as TicketData, _$identity);

  /// Serializes this TicketData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketData&&(identical(other.qrId, qrId) || other.qrId == qrId)&&(identical(other.pinCode, pinCode) || other.pinCode == pinCode)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.movieName, movieName) || other.movieName == movieName)&&(identical(other.hallName, hallName) || other.hallName == hallName)&&(identical(other.airingTimestamp, airingTimestamp) || other.airingTimestamp == airingTimestamp)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode)&&(identical(other.seatNumber, seatNumber) || other.seatNumber == seatNumber)&&(identical(other.seatPrice, seatPrice) || other.seatPrice == seatPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrId,pinCode,theaterName,movieName,hallName,airingTimestamp,screeningId,isleCode,seatNumber,seatPrice);

@override
String toString() {
  return 'TicketData(qrId: $qrId, pinCode: $pinCode, theaterName: $theaterName, movieName: $movieName, hallName: $hallName, airingTimestamp: $airingTimestamp, screeningId: $screeningId, isleCode: $isleCode, seatNumber: $seatNumber, seatPrice: $seatPrice)';
}


}

/// @nodoc
abstract mixin class $TicketDataCopyWith<$Res>  {
  factory $TicketDataCopyWith(TicketData value, $Res Function(TicketData) _then) = _$TicketDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ticket_qr_id') String qrId,@JsonKey(name: 'ticket_pin_code') int pinCode,@JsonKey(name: 'theater_name') String theaterName,@JsonKey(name: 'movie_name') String movieName,@JsonKey(name: 'hall_name') String hallName,@JsonKey(name: 'movie_airing_time') DateTime airingTimestamp,@JsonKey(name: 'movie_screening_id') int screeningId,@JsonKey(name: 'isle_code') String isleCode,@JsonKey(name: 'seat_no') int seatNumber,@JsonKey(name: 'seat_price') int seatPrice
});




}
/// @nodoc
class _$TicketDataCopyWithImpl<$Res>
    implements $TicketDataCopyWith<$Res> {
  _$TicketDataCopyWithImpl(this._self, this._then);

  final TicketData _self;
  final $Res Function(TicketData) _then;

/// Create a copy of TicketData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrId = null,Object? pinCode = null,Object? theaterName = null,Object? movieName = null,Object? hallName = null,Object? airingTimestamp = null,Object? screeningId = null,Object? isleCode = null,Object? seatNumber = null,Object? seatPrice = null,}) {
  return _then(_self.copyWith(
qrId: null == qrId ? _self.qrId : qrId // ignore: cast_nullable_to_non_nullable
as String,pinCode: null == pinCode ? _self.pinCode : pinCode // ignore: cast_nullable_to_non_nullable
as int,theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,movieName: null == movieName ? _self.movieName : movieName // ignore: cast_nullable_to_non_nullable
as String,hallName: null == hallName ? _self.hallName : hallName // ignore: cast_nullable_to_non_nullable
as String,airingTimestamp: null == airingTimestamp ? _self.airingTimestamp : airingTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,seatNumber: null == seatNumber ? _self.seatNumber : seatNumber // ignore: cast_nullable_to_non_nullable
as int,seatPrice: null == seatPrice ? _self.seatPrice : seatPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TicketData implements TicketData {
  const _TicketData({@JsonKey(name: 'ticket_qr_id') required this.qrId, @JsonKey(name: 'ticket_pin_code') required this.pinCode, @JsonKey(name: 'theater_name') required this.theaterName, @JsonKey(name: 'movie_name') required this.movieName, @JsonKey(name: 'hall_name') required this.hallName, @JsonKey(name: 'movie_airing_time') required this.airingTimestamp, @JsonKey(name: 'movie_screening_id') required this.screeningId, @JsonKey(name: 'isle_code') required this.isleCode, @JsonKey(name: 'seat_no') required this.seatNumber, @JsonKey(name: 'seat_price') required this.seatPrice});
  factory _TicketData.fromJson(Map<String, dynamic> json) => _$TicketDataFromJson(json);

@override@JsonKey(name: 'ticket_qr_id') final  String qrId;
@override@JsonKey(name: 'ticket_pin_code') final  int pinCode;
@override@JsonKey(name: 'theater_name') final  String theaterName;
@override@JsonKey(name: 'movie_name') final  String movieName;
@override@JsonKey(name: 'hall_name') final  String hallName;
@override@JsonKey(name: 'movie_airing_time') final  DateTime airingTimestamp;
@override@JsonKey(name: 'movie_screening_id') final  int screeningId;
@override@JsonKey(name: 'isle_code') final  String isleCode;
@override@JsonKey(name: 'seat_no') final  int seatNumber;
@override@JsonKey(name: 'seat_price') final  int seatPrice;

/// Create a copy of TicketData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketDataCopyWith<_TicketData> get copyWith => __$TicketDataCopyWithImpl<_TicketData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketData&&(identical(other.qrId, qrId) || other.qrId == qrId)&&(identical(other.pinCode, pinCode) || other.pinCode == pinCode)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.movieName, movieName) || other.movieName == movieName)&&(identical(other.hallName, hallName) || other.hallName == hallName)&&(identical(other.airingTimestamp, airingTimestamp) || other.airingTimestamp == airingTimestamp)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode)&&(identical(other.seatNumber, seatNumber) || other.seatNumber == seatNumber)&&(identical(other.seatPrice, seatPrice) || other.seatPrice == seatPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrId,pinCode,theaterName,movieName,hallName,airingTimestamp,screeningId,isleCode,seatNumber,seatPrice);

@override
String toString() {
  return 'TicketData(qrId: $qrId, pinCode: $pinCode, theaterName: $theaterName, movieName: $movieName, hallName: $hallName, airingTimestamp: $airingTimestamp, screeningId: $screeningId, isleCode: $isleCode, seatNumber: $seatNumber, seatPrice: $seatPrice)';
}


}

/// @nodoc
abstract mixin class _$TicketDataCopyWith<$Res> implements $TicketDataCopyWith<$Res> {
  factory _$TicketDataCopyWith(_TicketData value, $Res Function(_TicketData) _then) = __$TicketDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ticket_qr_id') String qrId,@JsonKey(name: 'ticket_pin_code') int pinCode,@JsonKey(name: 'theater_name') String theaterName,@JsonKey(name: 'movie_name') String movieName,@JsonKey(name: 'hall_name') String hallName,@JsonKey(name: 'movie_airing_time') DateTime airingTimestamp,@JsonKey(name: 'movie_screening_id') int screeningId,@JsonKey(name: 'isle_code') String isleCode,@JsonKey(name: 'seat_no') int seatNumber,@JsonKey(name: 'seat_price') int seatPrice
});




}
/// @nodoc
class __$TicketDataCopyWithImpl<$Res>
    implements _$TicketDataCopyWith<$Res> {
  __$TicketDataCopyWithImpl(this._self, this._then);

  final _TicketData _self;
  final $Res Function(_TicketData) _then;

/// Create a copy of TicketData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrId = null,Object? pinCode = null,Object? theaterName = null,Object? movieName = null,Object? hallName = null,Object? airingTimestamp = null,Object? screeningId = null,Object? isleCode = null,Object? seatNumber = null,Object? seatPrice = null,}) {
  return _then(_TicketData(
qrId: null == qrId ? _self.qrId : qrId // ignore: cast_nullable_to_non_nullable
as String,pinCode: null == pinCode ? _self.pinCode : pinCode // ignore: cast_nullable_to_non_nullable
as int,theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,movieName: null == movieName ? _self.movieName : movieName // ignore: cast_nullable_to_non_nullable
as String,hallName: null == hallName ? _self.hallName : hallName // ignore: cast_nullable_to_non_nullable
as String,airingTimestamp: null == airingTimestamp ? _self.airingTimestamp : airingTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,seatNumber: null == seatNumber ? _self.seatNumber : seatNumber // ignore: cast_nullable_to_non_nullable
as int,seatPrice: null == seatPrice ? _self.seatPrice : seatPrice // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
