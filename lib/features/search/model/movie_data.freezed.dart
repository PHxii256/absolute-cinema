// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieData {

 int get id; String get name; String get description;@JsonKey(name: 'poster_url') String? get posterUrl;@JsonKey(name: 'duration_minutes') int get durationMinutes;@JsonKey(name: 'release_date') DateTime get releaseDate;@JsonKey(name: 'primary_language') String get primaryLanguage;@JsonKey(name: 'age_rating_min') int get ageRatingMin;@JsonKey(name: 'subtitle_languages') List<String>? get subtitleLanguage;@JsonKey(readValue: _readGenres) List<String>? get genres; double? get rating; String? get director;
/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieDataCopyWith<MovieData> get copyWith => _$MovieDataCopyWithImpl<MovieData>(this as MovieData, _$identity);

  /// Serializes this MovieData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&(identical(other.ageRatingMin, ageRatingMin) || other.ageRatingMin == ageRatingMin)&&const DeepCollectionEquality().equals(other.subtitleLanguage, subtitleLanguage)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.director, director) || other.director == director));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,posterUrl,durationMinutes,releaseDate,primaryLanguage,ageRatingMin,const DeepCollectionEquality().hash(subtitleLanguage),const DeepCollectionEquality().hash(genres),rating,director);

@override
String toString() {
  return 'MovieData(id: $id, name: $name, description: $description, posterUrl: $posterUrl, durationMinutes: $durationMinutes, releaseDate: $releaseDate, primaryLanguage: $primaryLanguage, ageRatingMin: $ageRatingMin, subtitleLanguage: $subtitleLanguage, genres: $genres, rating: $rating, director: $director)';
}


}

/// @nodoc
abstract mixin class $MovieDataCopyWith<$Res>  {
  factory $MovieDataCopyWith(MovieData value, $Res Function(MovieData) _then) = _$MovieDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'poster_url') String? posterUrl,@JsonKey(name: 'duration_minutes') int durationMinutes,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'primary_language') String primaryLanguage,@JsonKey(name: 'age_rating_min') int ageRatingMin,@JsonKey(name: 'subtitle_languages') List<String>? subtitleLanguage,@JsonKey(readValue: _readGenres) List<String>? genres, double? rating, String? director
});




}
/// @nodoc
class _$MovieDataCopyWithImpl<$Res>
    implements $MovieDataCopyWith<$Res> {
  _$MovieDataCopyWithImpl(this._self, this._then);

  final MovieData _self;
  final $Res Function(MovieData) _then;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? posterUrl = freezed,Object? durationMinutes = null,Object? releaseDate = null,Object? primaryLanguage = null,Object? ageRatingMin = null,Object? subtitleLanguage = freezed,Object? genres = freezed,Object? rating = freezed,Object? director = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as String,ageRatingMin: null == ageRatingMin ? _self.ageRatingMin : ageRatingMin // ignore: cast_nullable_to_non_nullable
as int,subtitleLanguage: freezed == subtitleLanguage ? _self.subtitleLanguage : subtitleLanguage // ignore: cast_nullable_to_non_nullable
as List<String>?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MovieData implements MovieData {
  const _MovieData({required this.id, required this.name, required this.description, @JsonKey(name: 'poster_url') required this.posterUrl, @JsonKey(name: 'duration_minutes') required this.durationMinutes, @JsonKey(name: 'release_date') required this.releaseDate, @JsonKey(name: 'primary_language') required this.primaryLanguage, @JsonKey(name: 'age_rating_min') required this.ageRatingMin, @JsonKey(name: 'subtitle_languages') final  List<String>? subtitleLanguage = const [], @JsonKey(readValue: _readGenres) final  List<String>? genres = const [], this.rating, this.director}): _subtitleLanguage = subtitleLanguage,_genres = genres;
  factory _MovieData.fromJson(Map<String, dynamic> json) => _$MovieDataFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'poster_url') final  String? posterUrl;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override@JsonKey(name: 'release_date') final  DateTime releaseDate;
@override@JsonKey(name: 'primary_language') final  String primaryLanguage;
@override@JsonKey(name: 'age_rating_min') final  int ageRatingMin;
 final  List<String>? _subtitleLanguage;
@override@JsonKey(name: 'subtitle_languages') List<String>? get subtitleLanguage {
  final value = _subtitleLanguage;
  if (value == null) return null;
  if (_subtitleLanguage is EqualUnmodifiableListView) return _subtitleLanguage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _genres;
@override@JsonKey(readValue: _readGenres) List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? rating;
@override final  String? director;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieDataCopyWith<_MovieData> get copyWith => __$MovieDataCopyWithImpl<_MovieData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&(identical(other.ageRatingMin, ageRatingMin) || other.ageRatingMin == ageRatingMin)&&const DeepCollectionEquality().equals(other._subtitleLanguage, _subtitleLanguage)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.director, director) || other.director == director));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,posterUrl,durationMinutes,releaseDate,primaryLanguage,ageRatingMin,const DeepCollectionEquality().hash(_subtitleLanguage),const DeepCollectionEquality().hash(_genres),rating,director);

@override
String toString() {
  return 'MovieData(id: $id, name: $name, description: $description, posterUrl: $posterUrl, durationMinutes: $durationMinutes, releaseDate: $releaseDate, primaryLanguage: $primaryLanguage, ageRatingMin: $ageRatingMin, subtitleLanguage: $subtitleLanguage, genres: $genres, rating: $rating, director: $director)';
}


}

/// @nodoc
abstract mixin class _$MovieDataCopyWith<$Res> implements $MovieDataCopyWith<$Res> {
  factory _$MovieDataCopyWith(_MovieData value, $Res Function(_MovieData) _then) = __$MovieDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'poster_url') String? posterUrl,@JsonKey(name: 'duration_minutes') int durationMinutes,@JsonKey(name: 'release_date') DateTime releaseDate,@JsonKey(name: 'primary_language') String primaryLanguage,@JsonKey(name: 'age_rating_min') int ageRatingMin,@JsonKey(name: 'subtitle_languages') List<String>? subtitleLanguage,@JsonKey(readValue: _readGenres) List<String>? genres, double? rating, String? director
});




}
/// @nodoc
class __$MovieDataCopyWithImpl<$Res>
    implements _$MovieDataCopyWith<$Res> {
  __$MovieDataCopyWithImpl(this._self, this._then);

  final _MovieData _self;
  final $Res Function(_MovieData) _then;

/// Create a copy of MovieData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? posterUrl = freezed,Object? durationMinutes = null,Object? releaseDate = null,Object? primaryLanguage = null,Object? ageRatingMin = null,Object? subtitleLanguage = freezed,Object? genres = freezed,Object? rating = freezed,Object? director = freezed,}) {
  return _then(_MovieData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,posterUrl: freezed == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,releaseDate: null == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as DateTime,primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as String,ageRatingMin: null == ageRatingMin ? _self.ageRatingMin : ageRatingMin // ignore: cast_nullable_to_non_nullable
as int,subtitleLanguage: freezed == subtitleLanguage ? _self._subtitleLanguage : subtitleLanguage // ignore: cast_nullable_to_non_nullable
as List<String>?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
