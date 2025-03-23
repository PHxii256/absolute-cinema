// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theater_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TheaterData {

 String get theaterName; String get theaterLocation; String get theaterPriceRange; String get theaterSnacksPolicy; String get offersSnacks;
/// Create a copy of TheaterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TheaterDataCopyWith<TheaterData> get copyWith => _$TheaterDataCopyWithImpl<TheaterData>(this as TheaterData, _$identity);

  /// Serializes this TheaterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TheaterData&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterLocation, theaterLocation) || other.theaterLocation == theaterLocation)&&(identical(other.theaterPriceRange, theaterPriceRange) || other.theaterPriceRange == theaterPriceRange)&&(identical(other.theaterSnacksPolicy, theaterSnacksPolicy) || other.theaterSnacksPolicy == theaterSnacksPolicy)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterName,theaterLocation,theaterPriceRange,theaterSnacksPolicy,offersSnacks);

@override
String toString() {
  return 'TheaterData(theaterName: $theaterName, theaterLocation: $theaterLocation, theaterPriceRange: $theaterPriceRange, theaterSnacksPolicy: $theaterSnacksPolicy, offersSnacks: $offersSnacks)';
}


}

/// @nodoc
abstract mixin class $TheaterDataCopyWith<$Res>  {
  factory $TheaterDataCopyWith(TheaterData value, $Res Function(TheaterData) _then) = _$TheaterDataCopyWithImpl;
@useResult
$Res call({
 String theaterName, String theaterLocation, String theaterPriceRange, String theaterSnacksPolicy, String offersSnacks
});




}
/// @nodoc
class _$TheaterDataCopyWithImpl<$Res>
    implements $TheaterDataCopyWith<$Res> {
  _$TheaterDataCopyWithImpl(this._self, this._then);

  final TheaterData _self;
  final $Res Function(TheaterData) _then;

/// Create a copy of TheaterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theaterName = null,Object? theaterLocation = null,Object? theaterPriceRange = null,Object? theaterSnacksPolicy = null,Object? offersSnacks = null,}) {
  return _then(_self.copyWith(
theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterLocation: null == theaterLocation ? _self.theaterLocation : theaterLocation // ignore: cast_nullable_to_non_nullable
as String,theaterPriceRange: null == theaterPriceRange ? _self.theaterPriceRange : theaterPriceRange // ignore: cast_nullable_to_non_nullable
as String,theaterSnacksPolicy: null == theaterSnacksPolicy ? _self.theaterSnacksPolicy : theaterSnacksPolicy // ignore: cast_nullable_to_non_nullable
as String,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TheaterData implements TheaterData {
  const _TheaterData({required this.theaterName, required this.theaterLocation, required this.theaterPriceRange, required this.theaterSnacksPolicy, required this.offersSnacks});
  factory _TheaterData.fromJson(Map<String, dynamic> json) => _$TheaterDataFromJson(json);

@override final  String theaterName;
@override final  String theaterLocation;
@override final  String theaterPriceRange;
@override final  String theaterSnacksPolicy;
@override final  String offersSnacks;

/// Create a copy of TheaterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TheaterDataCopyWith<_TheaterData> get copyWith => __$TheaterDataCopyWithImpl<_TheaterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TheaterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TheaterData&&(identical(other.theaterName, theaterName) || other.theaterName == theaterName)&&(identical(other.theaterLocation, theaterLocation) || other.theaterLocation == theaterLocation)&&(identical(other.theaterPriceRange, theaterPriceRange) || other.theaterPriceRange == theaterPriceRange)&&(identical(other.theaterSnacksPolicy, theaterSnacksPolicy) || other.theaterSnacksPolicy == theaterSnacksPolicy)&&(identical(other.offersSnacks, offersSnacks) || other.offersSnacks == offersSnacks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterName,theaterLocation,theaterPriceRange,theaterSnacksPolicy,offersSnacks);

@override
String toString() {
  return 'TheaterData(theaterName: $theaterName, theaterLocation: $theaterLocation, theaterPriceRange: $theaterPriceRange, theaterSnacksPolicy: $theaterSnacksPolicy, offersSnacks: $offersSnacks)';
}


}

/// @nodoc
abstract mixin class _$TheaterDataCopyWith<$Res> implements $TheaterDataCopyWith<$Res> {
  factory _$TheaterDataCopyWith(_TheaterData value, $Res Function(_TheaterData) _then) = __$TheaterDataCopyWithImpl;
@override @useResult
$Res call({
 String theaterName, String theaterLocation, String theaterPriceRange, String theaterSnacksPolicy, String offersSnacks
});




}
/// @nodoc
class __$TheaterDataCopyWithImpl<$Res>
    implements _$TheaterDataCopyWith<$Res> {
  __$TheaterDataCopyWithImpl(this._self, this._then);

  final _TheaterData _self;
  final $Res Function(_TheaterData) _then;

/// Create a copy of TheaterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theaterName = null,Object? theaterLocation = null,Object? theaterPriceRange = null,Object? theaterSnacksPolicy = null,Object? offersSnacks = null,}) {
  return _then(_TheaterData(
theaterName: null == theaterName ? _self.theaterName : theaterName // ignore: cast_nullable_to_non_nullable
as String,theaterLocation: null == theaterLocation ? _self.theaterLocation : theaterLocation // ignore: cast_nullable_to_non_nullable
as String,theaterPriceRange: null == theaterPriceRange ? _self.theaterPriceRange : theaterPriceRange // ignore: cast_nullable_to_non_nullable
as String,theaterSnacksPolicy: null == theaterSnacksPolicy ? _self.theaterSnacksPolicy : theaterSnacksPolicy // ignore: cast_nullable_to_non_nullable
as String,offersSnacks: null == offersSnacks ? _self.offersSnacks : offersSnacks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
