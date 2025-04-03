// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketData _$TicketDataFromJson(Map<String, dynamic> json) => _TicketData(
  qrId: json['ticket_qr_id'] as String,
  pinCode: (json['ticket_pin_code'] as num).toInt(),
  theaterName: json['theater_name'] as String,
  movieName: json['movie_name'] as String,
  hallName: json['hall_name'] as String,
  airingTimestamp: DateTime.parse(json['movie_airing_time'] as String),
  screeningId: (json['movie_screening_id'] as num).toInt(),
  isleCode: json['isle_code'] as String,
  seatNumber: (json['seat_no'] as num).toInt(),
  seatPrice: (json['seat_price'] as num).toInt(),
);

Map<String, dynamic> _$TicketDataToJson(_TicketData instance) =>
    <String, dynamic>{
      'ticket_qr_id': instance.qrId,
      'ticket_pin_code': instance.pinCode,
      'theater_name': instance.theaterName,
      'movie_name': instance.movieName,
      'hall_name': instance.hallName,
      'movie_airing_time': instance.airingTimestamp.toIso8601String(),
      'movie_screening_id': instance.screeningId,
      'isle_code': instance.isleCode,
      'seat_no': instance.seatNumber,
      'seat_price': instance.seatPrice,
    };
