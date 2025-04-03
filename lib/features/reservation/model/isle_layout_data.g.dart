// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isle_layout_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IsleLayoutData _$IsleLayoutDataFromJson(Map<String, dynamic> json) =>
    _IsleLayoutData(
      theaterId: (json['theater_id'] as num).toInt(),
      hallId: (json['hall_id'] as num).toInt(),
      rowSeatCount: (json['row_seat_count'] as num).toInt(),
      rowCount: (json['row_count'] as num).toInt(),
      vipRowIndexes:
          (json['vip_row_indexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      gapRowIndexes:
          (json['gap_row_indexes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList(),
      isleCode: json['isle_code'] as String,
    );

Map<String, dynamic> _$IsleLayoutDataToJson(_IsleLayoutData instance) =>
    <String, dynamic>{
      'theater_id': instance.theaterId,
      'hall_id': instance.hallId,
      'row_seat_count': instance.rowSeatCount,
      'row_count': instance.rowCount,
      'vip_row_indexes': instance.vipRowIndexes,
      'gap_row_indexes': instance.gapRowIndexes,
      'isle_code': instance.isleCode,
    };
