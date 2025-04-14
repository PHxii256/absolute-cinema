// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActorData _$ActorDataFromJson(Map<String, dynamic> json) => _ActorData(
  id: (_readId(json, 'id') as num).toInt(),
  name: _readName(json, 'name') as String,
  role: json['actor_role'] as String,
);

Map<String, dynamic> _$ActorDataToJson(_ActorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'actor_role': instance.role,
    };
