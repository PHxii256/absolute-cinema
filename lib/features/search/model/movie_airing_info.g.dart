// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_airing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieAiringInfo _$MovieAiringInfoFromJson(Map<String, dynamic> json) =>
    _MovieAiringInfo(
      theaterName: json['name'] as String,
      theaterId: (json['theater_id'] as num).toInt(),
      hallId: (json['hall_id'] as num).toInt(),
      airingTimestamps:
          (json['airing_timestamps'] as List<dynamic>)
              .map((e) => DateTime.parse(e as String))
              .toList(),
      gMapsLink: json['gmaps_link'] as String,
      governorateName: json['governorate_name'] as String,
      areaName: json['area_name'] as String,
      streetName: json['street_name'] as String,
      allowsSnacks: json['allows_snacks'] as bool,
      offersSnacks: json['offers_snacks'] as bool,
      ticketPrice: (json['ticket_price'] as num).toInt(),
      vipSeatUpCharge: (json['vip_seat_upcharge'] as num?)?.toInt(),
      theaterRating: (json['rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieAiringInfoToJson(_MovieAiringInfo instance) =>
    <String, dynamic>{
      'name': instance.theaterName,
      'theater_id': instance.theaterId,
      'hall_id': instance.hallId,
      'airing_timestamps':
          instance.airingTimestamps.map((e) => e.toIso8601String()).toList(),
      'gmaps_link': instance.gMapsLink,
      'governorate_name': instance.governorateName,
      'area_name': instance.areaName,
      'street_name': instance.streetName,
      'allows_snacks': instance.allowsSnacks,
      'offers_snacks': instance.offersSnacks,
      'ticket_price': instance.ticketPrice,
      'vip_seat_upcharge': instance.vipSeatUpCharge,
      'rating': instance.theaterRating,
    };
