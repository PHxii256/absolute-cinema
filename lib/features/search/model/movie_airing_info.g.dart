// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_airing_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieAiringInfo _$MovieAiringInfoFromJson(Map<String, dynamic> json) =>
    _MovieAiringInfo(
      movieId: (json['movie_id'] as num).toInt(),
      screeningId: (json['screening_id'] as num).toInt(),
      screeningTimestamp: DateTime.parse(json['screening_timestamp'] as String),
      ticketPrice: (json['screening_ticket_price'] as num).toInt(),
      governorateName: json['theater_governorate_name'] as String,
      areaName: json['theater_area_name'] as String,
      streetName: json['theater_street_name'] as String,
      hallId: (json['hall_id'] as num).toInt(),
      hallName: json['hall_name'] as String,
      hallScreen: json['hall_screen'] as String,
      theaterName: json['theater_name'] as String,
      theaterId: (json['theater_id'] as num).toInt(),
      gMapsLink: json['theater_gmaps_link'] as String,
      allowsSnacks: json['theater_allows_snacks'] as bool,
      offersSnacks: json['theater_offers_snacks'] as bool,
      vipSeatUpCharge: (json['theater_vip_seat_upcharge'] as num?)?.toInt(),
      theaterRating: (json['theater_rating'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieAiringInfoToJson(_MovieAiringInfo instance) =>
    <String, dynamic>{
      'movie_id': instance.movieId,
      'screening_id': instance.screeningId,
      'screening_timestamp': instance.screeningTimestamp.toIso8601String(),
      'screening_ticket_price': instance.ticketPrice,
      'theater_governorate_name': instance.governorateName,
      'theater_area_name': instance.areaName,
      'theater_street_name': instance.streetName,
      'hall_id': instance.hallId,
      'hall_name': instance.hallName,
      'hall_screen': instance.hallScreen,
      'theater_name': instance.theaterName,
      'theater_id': instance.theaterId,
      'theater_gmaps_link': instance.gMapsLink,
      'theater_allows_snacks': instance.allowsSnacks,
      'theater_offers_snacks': instance.offersSnacks,
      'theater_vip_seat_upcharge': instance.vipSeatUpCharge,
      'theater_rating': instance.theaterRating,
    };
