// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_status_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeatStatusData _$SeatStatusDataFromJson(Map<String, dynamic> json) =>
    _SeatStatusData(
      reservedAt: DateTime.parse(json['reserved_at'] as String),
      screeningId: (json['screening_id'] as num).toInt(),
      userId: json['user_id'] as String,
      isleCode: json['isle_code'] as String,
      seatNumber: (json['seat_no'] as num).toInt(),
      isVip: json['is_vip'] as bool,
      booked: json['booked'] as bool,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$SeatStatusDataToJson(_SeatStatusData instance) =>
    <String, dynamic>{
      'reserved_at': instance.reservedAt.toIso8601String(),
      'screening_id': instance.screeningId,
      'user_id': instance.userId,
      'isle_code': instance.isleCode,
      'seat_no': instance.seatNumber,
      'is_vip': instance.isVip,
      'booked': instance.booked,
      'price': instance.price,
    };
