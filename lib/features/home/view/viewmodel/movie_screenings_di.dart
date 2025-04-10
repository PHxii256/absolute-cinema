import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class MovieScreeningsDI {
  static Future<List<MovieData>> getAllMovies() async {
    final resList = await Supabase.instance.client.from('movie_screening').select('*,movie(*, genres:genre(name))');

    log("all: $resList");
    return _parseJson(resList);
  }

  static AsyncValue<List<MovieData>> airingThisWeek(AsyncValue<List<MovieData>> provider) {
    List<MovieData> airingThisWeek = [];
    if (provider.hasValue) {
      for (var element in provider.value!) {
        final dayDiff = element.releaseDate.difference(DateTime.now()).inDays;
        if (dayDiff <= 0) {
          airingThisWeek.add(element);
        }
      }
    }
    return AsyncData(airingThisWeek);
  }

  //TO:DO check on screening time (parse whole object as a model)
  /*
[{id: 2, airing_timestamp: 2025-03-31T20:30:00, ticket_price: 60, hall_id: 1, theater_id: 1, movie_id: 1, vip_ticket_price: 120, 
movie: {id: 1, name: Suzume, genres: [{name: Adventure}, {name: Comedy}, {name: Anime}], rating: 7.6, director: Makato Shinkai, poster_url: https://bvquxsswjrznbrlcxrkk.supabase.co/storage/v1/object/sign/posters/Suzume.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJwb3N0ZXJzL1N1enVtZS5wbmciLCJpYXQiOjE3NDM5NjQ1MDksImV4cCI6MzMyNDg0Mjg1MDl9.ic-tKg6iZCfqXXBGn-3WYz51O_JTV2W_RfNHmvbOf3g,
 description: A modern action adventure road story where a 17-year-old girl named Suzume helps a mysterious young man close doors from the other side that are releasing disasters all over in Japan., 
 release_date: 2022-11-11, age_rating_min: 12, duration_minutes: 122, primary_language: Japanese, subtitle_languages: [Arabic, English]}}
 ,{id: 1, airing_timestamp: 2025-04-09T18:30:00, ticket_price: 60, hall_id: 1, theater_id: 1, movie_id: 1, vip_ticket_price: 120, ....
*/

  static AsyncValue<List<MovieData>> comingSoon(AsyncValue<List<MovieData>> provider) {
    List<MovieData> comingSoonMovies = [];
    if (provider.hasValue) {
      for (var element in provider.value!) {
        final dayDiff = element.releaseDate.difference(DateTime.now()).inDays;
        if (dayDiff > 0 && dayDiff < 30) {
          comingSoonMovies.add(element);
        }
      }
    }
    return AsyncData(comingSoonMovies);
  }

  static List<MovieData> _parseJson(List<Map<String, dynamic>> json) {
    final List<MovieData> movieDataList = [];
    for (var res in json) {
      final movieData = MovieData.fromJson(res["movie"]);
      if (!movieDataList.contains(movieData)) movieDataList.add(movieData);
    }
    return movieDataList;
  }

  static List<MovieData> getFilteredMovies(List<MovieData> initialData, FilterData currentFilters) {
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

  static bool allFiltersMatch(MovieData movie, FilterData currentFilters) {
    if (movie.genres!.toSet().containsAll(currentFilters.genreFilter) &&
        (currentFilters.languageFilter.isEmpty || currentFilters.languageFilter.contains(movie.primaryLanguage)) &&
        (currentFilters.ageFilter.isEmpty ||
            FilterData.getAgeFilterInt(currentFilters.ageFilter.first) >= movie.ageRatingMin)) {
      return true;
    }
    return false;
  }
}
