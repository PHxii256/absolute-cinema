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

@JsonKey(name: 'movie_id') int get movieId;@JsonKey(name: 'screening_id') int get screeningId;@JsonKey(name: 'screening_timestamp') DateTime get screeningTimestamp;@JsonKey(name: 'screening_ticket_price') int get ticketPrice;@JsonKey(name: 'theater_governorate_name') String get governorateName;@JsonKey(name: 'theater_area_name') String get areaName;@JsonKey(name: 'theater_street_name') String get streetName;@JsonKey(name: 'hall_id') int get hallId;@JsonKey(name: 'hall_name') String get hallName;@JsonKey(name: 'hall_screen') String get hallScreen;@JsonKey(name: 'theater_name') String get theaterName;@JsonKey(name: 'theater_id') int get theaterId;@JsonKey(name: 'theater_gmaps_link') String get gMapsLink;@JsonKey(name: 'theater_allows_snacks') bool get allowsSnacks;@JsonKey(name: 'theater_offers_snacks') bool get offersSnacks;@JsonKey(name: 'theater_vip_seat_upcharge') int? get vipSeatUpCharge;@JsonKey(name: 'theater_rating') int? get theaterRating;
/// Create a copy of MovieAiringInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieAiringInfoCopyWith<MovieAiringInfo> get copyWith => _$MovieAiringInfoCopyWithImpl<MovieAiringInfo>(this as MovieAiringInfo, _$identity);

  /// Serializes this MovieAiringInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieAiringInfo&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.screeningTimestamp, screeningTimestamp) || other.screeningTimestamp == screeningTimestamp)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.governorateName, governorateName) || other.governorateName == governorateName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&(identical(other.hallName, hallName) || other.hallName == hallName)&&(identical(other.hallScreen, hallScreen) || other.hallScreen == hallScreen)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.gMapsLink, gMapsLink) || other.gMapsLink == gMapsLink)&&(identical(other.allowsSnacks, allowsSnacks) || other.allowsSnacks == allowsSnacks)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks)&&(identical(other.vipSeatUpCharge, vipSeatUpCharge) || other.vipSeatUpCharge == vipSeatUpCharge)&&(identical(other.theaterRating, theaterRating) || other.theaterRating == theaterRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieId,screeningId,screeningTimestamp,ticketPrice,governorateName,areaName,streetName,hallId,hallName,hallScreen,theaterName,theaterId,gMapsLink,allowsSnacks,offersSnacks,vipSeatUpCharge,theaterRating);

@override
String toString() {
  return 'MovieAiringInfo(movieId: $movieId, screeningId: $screeningId, screeningTimestamp: $screeningTimestamp, ticketPrice: $ticketPrice, governorateName: $governorateName, areaName: $areaName, streetName: $streetName, hallId: $hallId, hallName: $hallName, hallScreen: $hallScreen, theaterName: $theaterName, theaterId: $theaterId, gMapsLink: $gMapsLink, allowsSnacks: $allowsSnacks, offersSnacks: $offersSnacks, vipSeatUpCharge: $vipSeatUpCharge, theaterRating: $theaterRating)';
}


}

/// @nodoc
abstract mixin class $MovieAiringInfoCopyWith<$Res>  {
  factory $MovieAiringInfoCopyWith(MovieAiringInfo value, $Res Function(MovieAiringInfo) _then) = _$MovieAiringInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'movie_id') int movieId,@JsonKey(name: 'screening_id') int screeningId,@JsonKey(name: 'screening_timestamp') DateTime screeningTimestamp,@JsonKey(name: 'screening_ticket_price') int ticketPrice,@JsonKey(name: 'theater_governorate_name') String governorateName,@JsonKey(name: 'theater_area_name') String areaName,@JsonKey(name: 'theater_street_name') String streetName,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'hall_name') String hallName,@JsonKey(name: 'hall_screen') String hallScreen,@JsonKey(name: 'theater_name') String theaterName,@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'theater_gmaps_link') String gMapsLink,@JsonKey(name: 'theater_allows_snacks') bool allowsSnacks,@JsonKey(name: 'theater_offers_snacks') bool offersSnacks,@JsonKey(name: 'theater_vip_seat_upcharge') int? vipSeatUpCharge,@JsonKey(name: 'theater_rating') int? theaterRating
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
@pragma('vm:prefer-inline') @override $Res call({Object? movieId = null,Object? screeningId = null,Object? screeningTimestamp = null,Object? ticketPrice = null,Object? governorateName = null,Object? areaName = null,Object? streetName = null,Object? hallId = null,Object? hallName = null,Object? hallScreen = null,Object? theaterName = null,Object? theaterId = null,Object? gMapsLink = null,Object? allowsSnacks = null,Object? offersSnacks = null,Object? vipSeatUpCharge = freezed,Object? theaterRating = freezed,}) {
  return _then(_self.copyWith(
movieId: null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,screeningTimestamp: null == screeningTimestamp ? _self.screeningTimestamp : screeningTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int,governorateName: null == governorateName ? _self.governorateName : governorateName // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,hallName: null == hallName ? _self.hallName : hallName // ignore: cast_nullable_to_non_nullable
as String,hallScreen: null == hallScreen ? _self.hallScreen : hallScreen // ignore: cast_nullable_to_non_nullable
as String,theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,gMapsLink: null == gMapsLink ? _self.gMapsLink : gMapsLink // ignore: cast_nullable_to_non_nullable
as String,allowsSnacks: null == allowsSnacks ? _self.allowsSnacks : allowsSnacks // ignore: cast_nullable_to_non_nullable
as bool,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as bool,vipSeatUpCharge: freezed == vipSeatUpCharge ? _self.vipSeatUpCharge : vipSeatUpCharge // ignore: cast_nullable_to_non_nullable
as int?,theaterRating: freezed == theaterRating ? _self.theaterRating : theaterRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieAiringInfo extends MovieAiringInfo {
  const _MovieAiringInfo({@JsonKey(name: 'movie_id') required this.movieId, @JsonKey(name: 'screening_id') required this.screeningId, @JsonKey(name: 'screening_timestamp') required this.screeningTimestamp, @JsonKey(name: 'screening_ticket_price') required this.ticketPrice, @JsonKey(name: 'theater_governorate_name') required this.governorateName, @JsonKey(name: 'theater_area_name') required this.areaName, @JsonKey(name: 'theater_street_name') required this.streetName, @JsonKey(name: 'hall_id') required this.hallId, @JsonKey(name: 'hall_name') required this.hallName, @JsonKey(name: 'hall_screen') required this.hallScreen, @JsonKey(name: 'theater_name') required this.theaterName, @JsonKey(name: 'theater_id') required this.theaterId, @JsonKey(name: 'theater_gmaps_link') required this.gMapsLink, @JsonKey(name: 'theater_allows_snacks') required this.allowsSnacks, @JsonKey(name: 'theater_offers_snacks') required this.offersSnacks, @JsonKey(name: 'theater_vip_seat_upcharge') this.vipSeatUpCharge, @JsonKey(name: 'theater_rating') this.theaterRating}): super._();
  factory _MovieAiringInfo.fromJson(Map<String, dynamic> json) => _$MovieAiringInfoFromJson(json);

@override@JsonKey(name: 'movie_id') final  int movieId;
@override@JsonKey(name: 'screening_id') final  int screeningId;
@override@JsonKey(name: 'screening_timestamp') final  DateTime screeningTimestamp;
@override@JsonKey(name: 'screening_ticket_price') final  int ticketPrice;
@override@JsonKey(name: 'theater_governorate_name') final  String governorateName;
@override@JsonKey(name: 'theater_area_name') final  String areaName;
@override@JsonKey(name: 'theater_street_name') final  String streetName;
@override@JsonKey(name: 'hall_id') final  int hallId;
@override@JsonKey(name: 'hall_name') final  String hallName;
@override@JsonKey(name: 'hall_screen') final  String hallScreen;
@override@JsonKey(name: 'theater_name') final  String theaterName;
@override@JsonKey(name: 'theater_id') final  int theaterId;
@override@JsonKey(name: 'theater_gmaps_link') final  String gMapsLink;
@override@JsonKey(name: 'theater_allows_snacks') final  bool allowsSnacks;
@override@JsonKey(name: 'theater_offers_snacks') final  bool offersSnacks;
@override@JsonKey(name: 'theater_vip_seat_upcharge') final  int? vipSeatUpCharge;
@override@JsonKey(name: 'theater_rating') final  int? theaterRating;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieAiringInfo&&(identical(other.movieId, movieId) || other.movieId == movieId)&&(identical(other.screeningId, screeningId) || other.screeningId == screeningId)&&(identical(other.screeningTimestamp, screeningTimestamp) || other.screeningTimestamp == screeningTimestamp)&&(identical(other.ticketPrice, ticketPrice) || other.ticketPrice == ticketPrice)&&(identical(other.governorateName, governorateName) || other.governorateName == governorateName)&&(identical(other.areaName, areaName) || other.areaName == areaName)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&(identical(other.hallName, hallName) || other.hallName == hallName)&&(identical(other.hallScreen, hallScreen) || other.hallScreen == hallScreen)&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.gMapsLink, gMapsLink) || other.gMapsLink == gMapsLink)&&(identical(other.allowsSnacks, allowsSnacks) || other.allowsSnacks == allowsSnacks)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks)&&(identical(other.vipSeatUpCharge, vipSeatUpCharge) || other.vipSeatUpCharge == vipSeatUpCharge)&&(identical(other.theaterRating, theaterRating) || other.theaterRating == theaterRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,movieId,screeningId,screeningTimestamp,ticketPrice,governorateName,areaName,streetName,hallId,hallName,hallScreen,theaterName,theaterId,gMapsLink,allowsSnacks,offersSnacks,vipSeatUpCharge,theaterRating);

@override
String toString() {
  return 'MovieAiringInfo(movieId: $movieId, screeningId: $screeningId, screeningTimestamp: $screeningTimestamp, ticketPrice: $ticketPrice, governorateName: $governorateName, areaName: $areaName, streetName: $streetName, hallId: $hallId, hallName: $hallName, hallScreen: $hallScreen, theaterName: $theaterName, theaterId: $theaterId, gMapsLink: $gMapsLink, allowsSnacks: $allowsSnacks, offersSnacks: $offersSnacks, vipSeatUpCharge: $vipSeatUpCharge, theaterRating: $theaterRating)';
}


}

/// @nodoc
abstract mixin class _$MovieAiringInfoCopyWith<$Res> implements $MovieAiringInfoCopyWith<$Res> {
  factory _$MovieAiringInfoCopyWith(_MovieAiringInfo value, $Res Function(_MovieAiringInfo) _then) = __$MovieAiringInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'movie_id') int movieId,@JsonKey(name: 'screening_id') int screeningId,@JsonKey(name: 'screening_timestamp') DateTime screeningTimestamp,@JsonKey(name: 'screening_ticket_price') int ticketPrice,@JsonKey(name: 'theater_governorate_name') String governorateName,@JsonKey(name: 'theater_area_name') String areaName,@JsonKey(name: 'theater_street_name') String streetName,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'hall_name') String hallName,@JsonKey(name: 'hall_screen') String hallScreen,@JsonKey(name: 'theater_name') String theaterName,@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'theater_gmaps_link') String gMapsLink,@JsonKey(name: 'theater_allows_snacks') bool allowsSnacks,@JsonKey(name: 'theater_offers_snacks') bool offersSnacks,@JsonKey(name: 'theater_vip_seat_upcharge') int? vipSeatUpCharge,@JsonKey(name: 'theater_rating') int? theaterRating
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
@override @pragma('vm:prefer-inline') $Res call({Object? movieId = null,Object? screeningId = null,Object? screeningTimestamp = null,Object? ticketPrice = null,Object? governorateName = null,Object? areaName = null,Object? streetName = null,Object? hallId = null,Object? hallName = null,Object? hallScreen = null,Object? theaterName = null,Object? theaterId = null,Object? gMapsLink = null,Object? allowsSnacks = null,Object? offersSnacks = null,Object? vipSeatUpCharge = freezed,Object? theaterRating = freezed,}) {
  return _then(_MovieAiringInfo(
movieId: null == movieId ? _self.movieId : movieId // ignore: cast_nullable_to_non_nullable
as int,screeningId: null == screeningId ? _self.screeningId : screeningId // ignore: cast_nullable_to_non_nullable
as int,screeningTimestamp: null == screeningTimestamp ? _self.screeningTimestamp : screeningTimestamp // ignore: cast_nullable_to_non_nullable
as DateTime,ticketPrice: null == ticketPrice ? _self.ticketPrice : ticketPrice // ignore: cast_nullable_to_non_nullable
as int,governorateName: null == governorateName ? _self.governorateName : governorateName // ignore: cast_nullable_to_non_nullable
as String,areaName: null == areaName ? _self.areaName : areaName // ignore: cast_nullable_to_non_nullable
as String,streetName: null == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,hallName: null == hallName ? _self.hallName : hallName // ignore: cast_nullable_to_non_nullable
as String,hallScreen: null == hallScreen ? _self.hallScreen : hallScreen // ignore: cast_nullable_to_non_nullable
as String,theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,gMapsLink: null == gMapsLink ? _self.gMapsLink : gMapsLink // ignore: cast_nullable_to_non_nullable
as String,allowsSnacks: null == allowsSnacks ? _self.allowsSnacks : allowsSnacks // ignore: cast_nullable_to_non_nullable
as bool,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as bool,vipSeatUpCharge: freezed == vipSeatUpCharge ? _self.vipSeatUpCharge : vipSeatUpCharge // ignore: cast_nullable_to_non_nullable
as int?,theaterRating: freezed == theaterRating ? _self.theaterRating : theaterRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
