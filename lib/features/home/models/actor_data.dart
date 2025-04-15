import 'package:freezed_annotation/freezed_annotation.dart';
part 'actor_data.freezed.dart';
part 'actor_data.g.dart';

String _readName(Map json, _) {
  return json["actor"]["name"] as String;
}

int _readId(Map json, _) {
  return json["actor"]["id"] as int;
}

@freezed
abstract class ActorData with _$ActorData {
  const factory ActorData({
    @JsonKey(readValue: _readId) required int id,
    @JsonKey(readValue: _readName) required String name,
    @JsonKey(name: "actor_role") required String role,
  }) = _ActorData;
  factory ActorData.fromJson(Map<String, Object?> json) => _$ActorDataFromJson(json);
}

/*
[
  {actor_role: Souta, actor: {id: 1, name: Hokuto Matsumura}}, 
  {actor_role: Suzume, actor: {id: 2, name: Nanoka Hara}}
]
*/
