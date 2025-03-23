// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_airing_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieAiringInfo {

@JsonKey(name: 'name') String get theaterName;@JsonKey(name: 'theater_id') int get theaterId;@JsonKey(name: 'hall_id') int get hallId;@JsonKey(name: 'airing_timestamps') List<DateTime> get airingTimestamps;@JsonKey(name: 'gmaps_link') String get gMapsLink;@JsonKey(name: 'governorate_name') String get governorateName;@JsonKey(name: 'area_name') String get areaName;@JsonKey(name: 'street_name') String get streetName;@JsonKey(name: 'allows_snacks') bool get allowsSnacks;@JsonKey(name: 'offers_snacks') bool get offersSnacks;@JsonKey(name: 'ticket_price') int get ticketPrice;@JsonKey(name: 'vip_seat_upcharge') int? get vipSeatUpCharge;@JsonKey(name: 'rating') int? get theaterRating;
/// Create a copy of MovieAiringInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieAiringInfoCopyWith<MovieAiringInfo> get copyWith => _$MovieAiringInfoCopyWithImpl<MovieAiringInfo>(this as MovieAiringInfo, _$identity);

  /// Serializes this MovieAiringInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieAiringInfo&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&const DeepCollectionEquality().equals(other.airingTimestamps, airingTimestamps)&&(identical(other.gMapsLink, gMapsLink) || other.gMapsLink == gMapsLink)&&(identical(other.governorateName, governorateName) || other.governorateName == governorateName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.allowsSnacks, allowsSnacks) || other.allowsSnacks == allowsSnacks)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.vipSeatUpCharge, vipSeatUpCharge) || other.vipSeatUpCharge == vipSeatUpCharge)&&(identical(other.theaterRating, theaterRating) || other.theaterRating == theaterRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterName,theaterId,hallId,const DeepCollectionEquality().hash(airingTimestamps),gMapsLink,governorateName,areaName,streetName,allowsSnacks,offersSnacks,ticketPrice,vipSeatUpCharge,theaterRating);

@override
String toString() {
  return 'MovieAiringInfo(theaterName: $theaterName, theaterId: $theaterId, hallId: $hallId, airingTimestamps: $airingTimestamps, gMapsLink: $gMapsLink, governorateName: $governorateName, areaName: $areaName, streetName: $streetName, allowsSnacks: $allowsSnacks, offersSnacks: $offersSnacks, ticketPrice: $ticketPrice, vipSeatUpCharge: $vipSeatUpCharge, theaterRating: $theaterRating)';
}


}

/// @nodoc
abstract mixin class $MovieAiringInfoCopyWith<$Res>  {
  factory $MovieAiringInfoCopyWith(MovieAiringInfo value, $Res Function(MovieAiringInfo) _then) = _$MovieAiringInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String theaterName,@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'airing_timestamps') List<DateTime> airingTimestamps,@JsonKey(name: 'gmaps_link') String gMapsLink,@JsonKey(name: 'governorate_name') String governorateName,@JsonKey(name: 'area_name') String areaName,@JsonKey(name: 'street_name') String streetName,@JsonKey(name: 'allows_snacks') bool allowsSnacks,@JsonKey(name: 'offers_snacks') bool offersSnacks,@JsonKey(name: 'ticket_price') int ticketPrice,@JsonKey(name: 'vip_seat_upcharge') int? vipSeatUpCharge,@JsonKey(name: 'rating') int? theaterRating
});




}
/// @nodoc
class _$MovieAiringInfoCopyWithImpl<$Res>
    implements $MovieAiringInfoCopyWith<$Res> {
  _$MovieAiringInfoCopyWithImpl(this._self, this._then);

  final MovieAiringInfo _self;
  final $Res Function(MovieAiringInfo) _then;

/// Create a copy of MovieAiringInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theaterName = null,Object? theaterId = null,Object? hallId = null,Object? airingTimestamps = null,Object? gMapsLink = null,Object? governorateName = null,Object? areaName = null,Object? streetName = null,Object? allowsSnacks = null,Object? offersSnacks = null,Object? ticketPrice = null,Object? vipSeatUpCharge = freezed,Object? theaterRating = freezed,}) {
  return _then(_self.copyWith(
theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,airingTimestamps: null == airingTimestamps ? _self.airingTimestamps : airingTimestamps // ignore: cast_nullable_to_non_nullable
as List<DateTime>,gMapsLink: null == gMapsLink ? _self.gMapsLink : gMapsLink // ignore: cast_nullable_to_non_nullable
as String,governorateName: null == governorateName ? _self.governorateName : governorateName // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,allowsSnacks: null == allowsSnacks ? _self.allowsSnacks : allowsSnacks // ignore: cast_nullable_to_non_nullable
as bool,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as bool,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int,vipSeatUpCharge: freezed == vipSeatUpCharge ? _self.vipSeatUpCharge : vipSeatUpCharge // ignore: cast_nullable_to_non_nullable
as int?,theaterRating: freezed == theaterRating ? _self.theaterRating : theaterRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieAiringInfo extends MovieAiringInfo {
  const _MovieAiringInfo({@JsonKey(name: 'name') required this.theaterName, @JsonKey(name: 'theater_id') required this.theaterId, @JsonKey(name: 'hall_id') required this.hallId, @JsonKey(name: 'airing_timestamps') required this.airingTimestamps, @JsonKey(name: 'gmaps_link') required this.gMapsLink, @JsonKey(name: 'governorate_name') required this.governorateName, @JsonKey(name: 'area_name') required this.areaName, @JsonKey(name: 'street_name') required this.streetName, @JsonKey(name: 'allows_snacks') required this.allowsSnacks, @JsonKey(name: 'offers_snacks') required this.offersSnacks, @JsonKey(name: 'ticket_price') required this.ticketPrice, @JsonKey(name: 'vip_seat_upcharge') this.vipSeatUpCharge, @JsonKey(name: 'rating') this.theaterRating}): super._();
  factory _MovieAiringInfo.fromJson(Map<String, dynamic> json) => _$MovieAiringInfoFromJson(json);

@override@JsonKey(name: 'name') final  String theaterName;
@override@JsonKey(name: 'theater_id') final  int theaterId;
@override@JsonKey(name: 'hall_id') final  int hallId;
@override@JsonKey(name: 'airing_timestamps') final  List<DateTime> airingTimestamps;
@override@JsonKey(name: 'gmaps_link') final  String gMapsLink;
@override@JsonKey(name: 'governorate_name') final  String governorateName;
@override@JsonKey(name: 'area_name') final  String areaName;
@override@JsonKey(name: 'street_name') final  String streetName;
@override@JsonKey(name: 'allows_snacks') final  bool allowsSnacks;
@override@JsonKey(name: 'offers_snacks') final  bool offersSnacks;
@override@JsonKey(name: 'ticket_price') final  int ticketPrice;
@override@JsonKey(name: 'vip_seat_upcharge') final  int? vipSeatUpCharge;
@override@JsonKey(name: 'rating') final  int? theaterRating;

/// Create a copy of MovieAiringInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieAiringInfoCopyWith<_MovieAiringInfo> get copyWith => __$MovieAiringInfoCopyWithImpl<_MovieAiringInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieAiringInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieAiringInfo&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&const DeepCollectionEquality().equals(other.airingTimestamps, airingTimestamps)&&(identical(other.gMapsLink, gMapsLink) || other.gMapsLink == gMapsLink)&&(identical(other.governorateName, governorateName) || other.governorateName == governorateName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.allowsSnacks, allowsSnacks) || other.allowsSnacks == allowsSnacks)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.vipSeatUpCharge, vipSeatUpCharge) || other.vipSeatUpCharge == vipSeatUpCharge)&&(identical(other.theaterRating, theaterRating) || other.theaterRating == theaterRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterName,theaterId,hallId,const DeepCollectionEquality().hash(airingTimestamps),gMapsLink,governorateName,areaName,streetName,allowsSnacks,offersSnacks,ticketPrice,vipSeatUpCharge,theaterRating);

@override
String toString() {
  return 'MovieAiringInfo(theaterName: $theaterName, theaterId: $theaterId, hallId: $hallId, airingTimestamps: $airingTimestamps, gMapsLink: $gMapsLink, governorateName: $governorateName, areaName: $areaName, streetName: $streetName, allowsSnacks: $allowsSnacks, offersSnacks: $offersSnacks, ticketPrice: $ticketPrice, vipSeatUpCharge: $vipSeatUpCharge, theaterRating: $theaterRating)';
}


}

/// @nodoc
abstract mixin class _$MovieAiringInfoCopyWith<$Res> implements $MovieAiringInfoCopyWith<$Res> {
  factory _$MovieAiringInfoCopyWith(_MovieAiringInfo value, $Res Function(_MovieAiringInfo) _then) = __$MovieAiringInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String theaterName,@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'airing_timestamps') List<DateTime> airingTimestamps,@JsonKey(name: 'gmaps_link') String gMapsLink,@JsonKey(name: 'governorate_name') String governorateName,@JsonKey(name: 'area_name') String areaName,@JsonKey(name: 'street_name') String streetName,@JsonKey(name: 'allows_snacks') bool allowsSnacks,@JsonKey(name: 'offers_snacks') bool offersSnacks,@JsonKey(name: 'ticket_price') int ticketPrice,@JsonKey(name: 'vip_seat_upcharge') int? vipSeatUpCharge,@JsonKey(name: 'rating') int? theaterRating
});




}
/// @nodoc
class __$MovieAiringInfoCopyWithImpl<$Res>
    implements _$MovieAiringInfoCopyWith<$Res> {
  __$MovieAiringInfoCopyWithImpl(this._self, this._then);

  final _MovieAiringInfo _self;
  final $Res Function(_MovieAiringInfo) _then;

/// Create a copy of MovieAiringInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theaterName = null,Object? theaterId = null,Object? hallId = null,Object? airingTimestamps = null,Object? gMapsLink = null,Object? governorateName = null,Object? areaName = null,Object? streetName = null,Object? allowsSnacks = null,Object? offersSnacks = null,Object? ticketPrice = null,Object? vipSeatUpCharge = freezed,Object? theaterRating = freezed,}) {
  return _then(_MovieAiringInfo(
theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,airingTimestamps: null == airingTimestamps ? _self.airingTimestamps : airingTimestamps // ignore: cast_nullable_to_non_nullable
as List<DateTime>,gMapsLink: null == gMapsLink ? _self.gMapsLink : gMapsLink // ignore: cast_nullable_to_non_nullable
as String,governorateName: null == governorateName ? _self.governorateName : governorateName // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,allowsSnacks: null == allowsSnacks ? _self.allowsSnacks : allowsSnacks // ignore: cast_nullable_to_non_nullable
as bool,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as bool,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int,vipSeatUpCharge: freezed == vipSeatUpCharge ? _self.vipSeatUpCharge : vipSeatUpCharge // ignore: cast_nullable_to_non_nullable
as int?,theaterRating: freezed == theaterRating ? _self.theaterRating : theaterRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
