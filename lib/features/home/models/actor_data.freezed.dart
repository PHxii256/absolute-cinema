// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActorData {

@JsonKey(readValue: _readId) int get id;@JsonKey(readValue: _readName) String get name;@JsonKey(name: "actor_role") String get role;
/// Create a copy of ActorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActorDataCopyWith<ActorData> get copyWith => _$ActorDataCopyWithImpl<ActorData>(this as ActorData, _$identity);

  /// Serializes this ActorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActorData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role);

@override
String toString() {
  return 'ActorData(id: $id, name: $name, role: $role)';
}


}

/// @nodoc
abstract mixin class $ActorDataCopyWith<$Res>  {
  factory $ActorDataCopyWith(ActorData value, $Res Function(ActorData) _then) = _$ActorDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readId) int id,@JsonKey(readValue: _readName) String name,@JsonKey(name: "actor_role") String role
});




}
/// @nodoc
class _$ActorDataCopyWithImpl<$Res>
    implements $ActorDataCopyWith<$Res> {
  _$ActorDataCopyWithImpl(this._self, this._then);

  final ActorData _self;
  final $Res Function(ActorData) _then;

/// Create a copy of ActorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? role = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ActorData implements ActorData {
  const _ActorData({@JsonKey(readValue: _readId) required this.id, @JsonKey(readValue: _readName) required this.name, @JsonKey(name: "actor_role") required this.role});
  factory _ActorData.fromJson(Map<String, dynamic> json) => _$ActorDataFromJson(json);

@override@JsonKey(readValue: _readId) final  int id;
@override@JsonKey(readValue: _readName) final  String name;
@override@JsonKey(name: "actor_role") final  String role;

/// Create a copy of ActorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActorDataCopyWith<_ActorData> get copyWith => __$ActorDataCopyWithImpl<_ActorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActorData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,role);

@override
String toString() {
  return 'ActorData(id: $id, name: $name, role: $role)';
}


}

/// @nodoc
abstract mixin class _$ActorDataCopyWith<$Res> implements $ActorDataCopyWith<$Res> {
  factory _$ActorDataCopyWith(_ActorData value, $Res Function(_ActorData) _then) = __$ActorDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readId) int id,@JsonKey(readValue: _readName) String name,@JsonKey(name: "actor_role") String role
});




}
/// @nodoc
class __$ActorDataCopyWithImpl<$Res>
    implements _$ActorDataCopyWith<$Res> {
  __$ActorDataCopyWithImpl(this._self, this._then);

  final _ActorData _self;
  final $Res Function(_ActorData) _then;

/// Create a copy of ActorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? role = null,}) {
  return _then(_ActorData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
