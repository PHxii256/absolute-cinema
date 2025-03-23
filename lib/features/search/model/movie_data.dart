import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_data.freezed.dart';
part 'movie_data.g.dart';

@freezed
abstract class MovieData with _$MovieData {
  const factory MovieData({
    required int id,
    required String name,
    required String description,
    @JsonKey(name: 'duration_minutes') required int durationMinutes,
    @JsonKey(name: 'release_date') required DateTime releaseDate,
    @JsonKey(name: 'primary_language') required String primaryLanguage,
    @JsonKey(name: 'age_rating_min') required int ageRatingMin,
    @JsonKey(name: 'subtitle_languages') @Default([]) List<String>? subtitleLanguage,
    double? rating,
    String? director,
  }) = _MovieData;

  factory MovieData.fromJson(Map<String, Object?> json) => _$MovieDataFromJson(json);
}
