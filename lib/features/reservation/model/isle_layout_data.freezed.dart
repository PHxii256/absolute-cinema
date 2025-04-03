// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isle_layout_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IsleLayoutData {

@JsonKey(name: 'theater_id') int get theaterId;@JsonKey(name: 'hall_id') int get hallId;@JsonKey(name: 'row_seat_count') int get rowSeatCount;@JsonKey(name: 'row_count') int get rowCount;@JsonKey(name: 'vip_row_indexes') List<int>? get vipRowIndexes;@JsonKey(name: 'gap_row_indexes') List<int>? get gapRowIndexes;@JsonKey(name: 'isle_code') String get isleCode;
/// Create a copy of IsleLayoutData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsleLayoutDataCopyWith<IsleLayoutData> get copyWith => _$IsleLayoutDataCopyWithImpl<IsleLayoutData>(this as IsleLayoutData, _$identity);

  /// Serializes this IsleLayoutData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsleLayoutData&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&(identical(other.rowSeatCount, rowSeatCount) || other.rowSeatCount == rowSeatCount)&&(identical(other.rowCount, rowCount) || other.rowCount == rowCount)&&const DeepCollectionEquality().equals(other.vipRowIndexes, vipRowIndexes)&&const DeepCollectionEquality().equals(other.gapRowIndexes, gapRowIndexes)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterId,hallId,rowSeatCount,rowCount,const DeepCollectionEquality().hash(vipRowIndexes),const DeepCollectionEquality().hash(gapRowIndexes),isleCode);

@override
String toString() {
  return 'IsleLayoutData(theaterId: $theaterId, hallId: $hallId, rowSeatCount: $rowSeatCount, rowCount: $rowCount, vipRowIndexes: $vipRowIndexes, gapRowIndexes: $gapRowIndexes, isleCode: $isleCode)';
}


}

/// @nodoc
abstract mixin class $IsleLayoutDataCopyWith<$Res>  {
  factory $IsleLayoutDataCopyWith(IsleLayoutData value, $Res Function(IsleLayoutData) _then) = _$IsleLayoutDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'row_seat_count') int rowSeatCount,@JsonKey(name: 'row_count') int rowCount,@JsonKey(name: 'vip_row_indexes') List<int>? vipRowIndexes,@JsonKey(name: 'gap_row_indexes') List<int>? gapRowIndexes,@JsonKey(name: 'isle_code') String isleCode
});




}
/// @nodoc
class _$IsleLayoutDataCopyWithImpl<$Res>
    implements $IsleLayoutDataCopyWith<$Res> {
  _$IsleLayoutDataCopyWithImpl(this._self, this._then);

  final IsleLayoutData _self;
  final $Res Function(IsleLayoutData) _then;

/// Create a copy of IsleLayoutData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theaterId = null,Object? hallId = null,Object? rowSeatCount = null,Object? rowCount = null,Object? vipRowIndexes = freezed,Object? gapRowIndexes = freezed,Object? isleCode = null,}) {
  return _then(_self.copyWith(
theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,rowSeatCount: null == rowSeatCount ? _self.rowSeatCount : rowSeatCount // ignore: cast_nullable_to_non_nullable
as int,rowCount: null == rowCount ? _self.rowCount : rowCount // ignore: cast_nullable_to_non_nullable
as int,vipRowIndexes: freezed == vipRowIndexes ? _self.vipRowIndexes : vipRowIndexes // ignore: cast_nullable_to_non_nullable
as List<int>?,gapRowIndexes: freezed == gapRowIndexes ? _self.gapRowIndexes : gapRowIndexes // ignore: cast_nullable_to_non_nullable
as List<int>?,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _IsleLayoutData implements IsleLayoutData {
  const _IsleLayoutData({@JsonKey(name: 'theater_id') required this.theaterId, @JsonKey(name: 'hall_id') required this.hallId, @JsonKey(name: 'row_seat_count') required this.rowSeatCount, @JsonKey(name: 'row_count') required this.rowCount, @JsonKey(name: 'vip_row_indexes') required final  List<int>? vipRowIndexes, @JsonKey(name: 'gap_row_indexes') required final  List<int>? gapRowIndexes, @JsonKey(name: 'isle_code') required this.isleCode}): _vipRowIndexes = vipRowIndexes,_gapRowIndexes = gapRowIndexes;
  factory _IsleLayoutData.fromJson(Map<String, dynamic> json) => _$IsleLayoutDataFromJson(json);

@override@JsonKey(name: 'theater_id') final  int theaterId;
@override@JsonKey(name: 'hall_id') final  int hallId;
@override@JsonKey(name: 'row_seat_count') final  int rowSeatCount;
@override@JsonKey(name: 'row_count') final  int rowCount;
 final  List<int>? _vipRowIndexes;
@override@JsonKey(name: 'vip_row_indexes') List<int>? get vipRowIndexes {
  final value = _vipRowIndexes;
  if (value == null) return null;
  if (_vipRowIndexes is EqualUnmodifiableListView) return _vipRowIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int>? _gapRowIndexes;
@override@JsonKey(name: 'gap_row_indexes') List<int>? get gapRowIndexes {
  final value = _gapRowIndexes;
  if (value == null) return null;
  if (_gapRowIndexes is EqualUnmodifiableListView) return _gapRowIndexes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'isle_code') final  String isleCode;

/// Create a copy of IsleLayoutData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsleLayoutDataCopyWith<_IsleLayoutData> get copyWith => __$IsleLayoutDataCopyWithImpl<_IsleLayoutData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsleLayoutDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsleLayoutData&&(identical(other.theaterId, theaterId) || other.theaterId == theaterId)&&(identical(other.hallId, hallId) || other.hallId == hallId)&&(identical(other.rowSeatCount, rowSeatCount) || other.rowSeatCount == rowSeatCount)&&(identical(other.rowCount, rowCount) || other.rowCount == rowCount)&&const DeepCollectionEquality().equals(other._vipRowIndexes, _vipRowIndexes)&&const DeepCollectionEquality().equals(other._gapRowIndexes, _gapRowIndexes)&&(identical(other.isleCode, isleCode) || other.isleCode == isleCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theaterId,hallId,rowSeatCount,rowCount,const DeepCollectionEquality().hash(_vipRowIndexes),const DeepCollectionEquality().hash(_gapRowIndexes),isleCode);

@override
String toString() {
  return 'IsleLayoutData(theaterId: $theaterId, hallId: $hallId, rowSeatCount: $rowSeatCount, rowCount: $rowCount, vipRowIndexes: $vipRowIndexes, gapRowIndexes: $gapRowIndexes, isleCode: $isleCode)';
}


}

/// @nodoc
abstract mixin class _$IsleLayoutDataCopyWith<$Res> implements $IsleLayoutDataCopyWith<$Res> {
  factory _$IsleLayoutDataCopyWith(_IsleLayoutData value, $Res Function(_IsleLayoutData) _then) = __$IsleLayoutDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'theater_id') int theaterId,@JsonKey(name: 'hall_id') int hallId,@JsonKey(name: 'row_seat_count') int rowSeatCount,@JsonKey(name: 'row_count') int rowCount,@JsonKey(name: 'vip_row_indexes') List<int>? vipRowIndexes,@JsonKey(name: 'gap_row_indexes') List<int>? gapRowIndexes,@JsonKey(name: 'isle_code') String isleCode
});




}
/// @nodoc
class __$IsleLayoutDataCopyWithImpl<$Res>
    implements _$IsleLayoutDataCopyWith<$Res> {
  __$IsleLayoutDataCopyWithImpl(this._self, this._then);

  final _IsleLayoutData _self;
  final $Res Function(_IsleLayoutData) _then;

/// Create a copy of IsleLayoutData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theaterId = null,Object? hallId = null,Object? rowSeatCount = null,Object? rowCount = null,Object? vipRowIndexes = freezed,Object? gapRowIndexes = freezed,Object? isleCode = null,}) {
  return _then(_IsleLayoutData(
theaterId: null == theaterId ? _self.theaterId : theaterId // ignore: cast_nullable_to_non_nullable
as int,hallId: null == hallId ? _self.hallId : hallId // ignore: cast_nullable_to_non_nullable
as int,rowSeatCount: null == rowSeatCount ? _self.rowSeatCount : rowSeatCount // ignore: cast_nullable_to_non_nullable
as int,rowCount: null == rowCount ? _self.rowCount : rowCount // ignore: cast_nullable_to_non_nullable
as int,vipRowIndexes: freezed == vipRowIndexes ? _self._vipRowIndexes : vipRowIndexes // ignore: cast_nullable_to_non_nullable
as List<int>?,gapRowIndexes: freezed == gapRowIndexes ? _self._gapRowIndexes : gapRowIndexes // ignore: cast_nullable_to_non_nullable
as List<int>?,isleCode: null == isleCode ? _self.isleCode : isleCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
