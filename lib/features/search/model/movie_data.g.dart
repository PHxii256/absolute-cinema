// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieData _$MovieDataFromJson(Map<String, dynamic> json) => _MovieData(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  posterUrl: json['poster_url'] as String?,
  durationMinutes: (json['duration_minutes'] as num).toInt(),
  releaseDate: DateTime.parse(json['release_date'] as String),
  primaryLanguage: json['primary_language'] as String,
  ageRatingMin: (json['age_rating_min'] as num).toInt(),
  subtitleLanguage:
      (json['subtitle_languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  genres:
      (_readGenres(json, 'genres') as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  rating: (json['rating'] as num?)?.toDouble(),
  director: json['director'] as String?,
);

Map<String, dynamic> _$MovieDataToJson(_MovieData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'poster_url': instance.posterUrl,
      'duration_minutes': instance.durationMinutes,
      'release_date': instance.releaseDate.toIso8601String(),
      'primary_language': instance.primaryLanguage,
      'age_rating_min': instance.ageRatingMin,
      'subtitle_languages': instance.subtitleLanguage,
      'genres': instance.genres,
      'rating': instance.rating,
      'director': instance.director,
    };
