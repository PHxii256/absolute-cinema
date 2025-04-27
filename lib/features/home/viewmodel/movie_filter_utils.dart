import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/age_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/category_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/language_filter.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';

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
