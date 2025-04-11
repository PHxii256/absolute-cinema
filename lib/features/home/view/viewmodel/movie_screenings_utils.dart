import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class MovieScreeningsUtils {
  static Map<int, List<DateTime>> screeningTimesamps = {};

  static Future<List<MovieData>> getAllMovies() async {
    final resList = await Supabase.instance.client.from('movie_screening').select('*,movie(*, genres:genre(name))');
    return _parseJson(resList);
  }

  static AsyncValue<List<MovieData>> releasedMovies(AsyncValue<List<MovieData>> provider) {
    List<MovieData> releasedMovies = [];
    if (provider.hasValue) {
      for (var movieData in provider.value!) {
        if (isReleased(movieData)) releasedMovies.add(movieData);
      }
    }
    return AsyncData(releasedMovies);
  }

  static AsyncValue<List<MovieData>> airingThisWeek(AsyncValue<List<MovieData>> provider) {
    List<MovieData> airingThisWeek = [];
    if (provider.hasValue) {
      for (var movieData in provider.value!) {
        if (isReleased(movieData) && _isAiringThisWeek(movieData)) airingThisWeek.add(movieData);
      }
    }
    return AsyncData(airingThisWeek);
  }

  static AsyncValue<List<MovieData>> comingSoon(AsyncValue<List<MovieData>> provider) {
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

  //TO:DO check on screening time (parse whole object as a model)
  /*
[{id: 2, airing_timestamp: 2025-03-31T20:30:00, ticket_price: 60, hall_id: 1, theater_id: 1, movie_id: 1, vip_ticket_price: 120, 
movie: {id: 1, name: Suzume, genres: [{name: Adventure}, {name: Comedy}, {name: Anime}], rating: 7.6, director: Makato Shinkai, poster_url: https://bvquxsswjrznbrlcxrkk.supabase.co/storage/v1/object/sign/posters/Suzume.png?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJwb3N0ZXJzL1N1enVtZS5wbmciLCJpYXQiOjE3NDM5NjQ1MDksImV4cCI6MzMyNDg0Mjg1MDl9.ic-tKg6iZCfqXXBGn-3WYz51O_JTV2W_RfNHmvbOf3g,
 description: A modern action adventure road story where a 17-year-old girl named Suzume helps a mysterious young man close doors from the other side that are releasing disasters all over in Japan., 
 release_date: 2022-11-11, age_rating_min: 12, duration_minutes: 122, primary_language: Japanese, subtitle_languages: [Arabic, English]}}
 ,{id: 1, airing_timestamp: 2025-04-09T18:30:00, ticket_price: 60, hall_id: 1, theater_id: 1, movie_id: 1, vip_ticket_price: 120, ....
*/

  static bool isReleased(MovieData data) {
    final dayDiff = data.releaseDate.difference(DateTime.now()).inDays;
    if (dayDiff <= 0) return true;
    return false;
  }

  static bool _isAiringThisWeek(MovieData data) {
    if (!screeningTimesamps.containsKey(data.id)) return false;
    DateTime firstTimestamp = screeningTimesamps[data.id]!.first;

    for (var timestamp in screeningTimesamps[data.id]!) {
      timestamp.isBefore(firstTimestamp);
    }

    if (firstTimestamp.difference(DateTime.now()).inDays <= 7) return true;

    return false;
  }

  static List<MovieData> _parseJson(List<Map<String, dynamic>> json) {
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
    log(screeningTimesamps.toString());
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
