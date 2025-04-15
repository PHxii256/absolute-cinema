import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/age_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/category_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/language_filter.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

final Map<int, List<DateTime>> screeningTimesamps = {};

Future<List<MovieData>> getAllMovies() async {
  final resList = await Supabase.instance.client.from('movie_screening').select('*,movie(*, genres:genre(name))');
  return _parseJson(resList);
}

AsyncValue<List<MovieData>> releasedMovies(AsyncValue<List<MovieData>> provider) {
  List<MovieData> releasedMovies = [];
  if (provider.hasValue) {
    for (var movieData in provider.value!) {
      if (isReleased(movieData)) releasedMovies.add(movieData);
    }
  }
  return AsyncData(releasedMovies);
}

AsyncValue<List<MovieData>> airingThisWeek(AsyncValue<List<MovieData>> provider) {
  List<MovieData> airingThisWeek = [];
  if (provider.hasValue) {
    for (var movieData in provider.value!) {
      if (isReleased(movieData) && _isAiringThisWeek(movieData)) airingThisWeek.add(movieData);
    }
  }
  return AsyncData(airingThisWeek);
}

AsyncValue<List<MovieData>> comingSoon(AsyncValue<List<MovieData>> provider) {
  List<MovieData> comingSoonMovies = [];
  if (provider.hasValue) {
    for (var movieData in provider.value!) {
      final dayDiff = movieData.releaseDate.difference(DateTime.now()).inDays;
      if (dayDiff > 0 && dayDiff < 30) {
        comingSoonMovies.add(movieData);
      }
    }
  }
  return AsyncData(comingSoonMovies);
}

bool isReleased(MovieData data) {
  final dayDiff = data.releaseDate.difference(DateTime.now()).inDays;
  if (dayDiff <= 0) return true;
  return false;
}

bool _isAiringThisWeek(MovieData data) {
  if (!screeningTimesamps.containsKey(data.id)) return false;
  DateTime firstTimestamp = screeningTimesamps[data.id]!.first;

  for (var timestamp in screeningTimesamps[data.id]!) {
    timestamp.isBefore(firstTimestamp);
  }

  if (firstTimestamp.difference(DateTime.now()).inDays <= 7) return true;

  return false;
}

List<MovieData> _parseJson(List<Map<String, dynamic>> json) {
  final List<MovieData> movieDataList = [];
  try {
    for (var res in json) {
      final movieData = MovieData.fromJson(res["movie"]);
      final movieId = res["movie"]["id"];
      final timestamp = DateTime.parse(res["airing_timestamp"]);

      screeningTimesamps.update(
        movieId,
        (value) {
          value.add(timestamp);
          return value;
        },
        ifAbsent: () {
          movieDataList.add(movieData);
          return <DateTime>[timestamp];
        },
      );
    }
  } catch (e) {
    log(e.toString());
  }
  return movieDataList;
}

List<MovieData> getFilteredMovies(List<MovieData> initialData, Map<AbstractFilter, Set<String>> currentFilters) {
  if (initialData.isNotEmpty) {
    return initialData.where((movie) {
      if (movie.genres == null) return true;
      if (allFiltersMatch(movie, currentFilters)) return true;
      return false;
    }).toList();
  } else {
    return initialData;
  }
}

bool allFiltersMatch(MovieData movie, Map<AbstractFilter, Set<String>> currentFilters) {
  for (var entry in currentFilters.entries) {
    if (entry.key is CategoryFilter) {
      if (!movie.genres!.toSet().containsAll(entry.value)) return false;
    } else if (entry.key is LanguageFilter && entry.value.isNotEmpty) {
      if (!entry.value.contains(movie.primaryLanguage)) return false;
    } else if (entry.key is AgeFilter && entry.value.isNotEmpty) {
      if (AgeFilter.getAgeFilterInt(entry.value.first) < movie.ageRatingMin) return false;
    }
  }
  return true;
}
