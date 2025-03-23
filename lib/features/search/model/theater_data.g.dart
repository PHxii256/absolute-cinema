// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theater_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TheaterData _$TheaterDataFromJson(Map<String, dynamic> json) => _TheaterData(
  theaterName: json['theaterName'] as String,
  theaterLocation: json['theaterLocation'] as String,
  theaterPriceRange: json['theaterPriceRange'] as String,
  theaterSnacksPolicy: json['theaterSnacksPolicy'] as String,
  offersSnacks: json['offersSnacks'] as String,
);

Map<String, dynamic> _$TheaterDataToJson(_TheaterData instance) =>
    <String, dynamic>{
      'theaterName': instance.theaterName,
      'theaterLocation': instance.theaterLocation,
      'theaterPriceRange': instance.theaterPriceRange,
      'theaterSnacksPolicy': instance.theaterSnacksPolicy,
      'offersSnacks': instance.offersSnacks,
    };
