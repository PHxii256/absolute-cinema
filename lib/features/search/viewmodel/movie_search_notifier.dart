import 'package:flutter_application/features/home/viewmodel/movie_screenings_utils.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'movie_search_notifier.g.dart';

@riverpod
class MovieSearch extends _$MovieSearch {
  @override
  Future<List<MovieData>> build() async {
    return [];
  }

  void searchQuery(String query) async {
    state = AsyncValue.loading();
    //final filters = ref.read(movieFiltersProvider);
    final queryRes = await _getSearchResults(query);
    state = AsyncData(getFilteredMovies(queryRes, {}));
  }

  Future<List<MovieData>> _getSearchResults(String query) async {
    List<MovieData> movieResults = [];
    movieResults = await _getMoviesByActor(query);
    if (movieResults.isNotEmpty) return movieResults;
    return await _getMoviesByName(query);
  }

  Future<List<MovieData>> _getMoviesByActor(String query) async {
    List<MovieData> movieResults = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('actor')
        .select('*, movie(*, genres:genre(name))')
        .textSearch('name', query);

    for (var result in dbResultList) {
      final movieList = result["movie"];
      for (var movie in movieList) {
        movie as Map<String, dynamic>;
        MovieData data = MovieData.fromJson(movie);
        movieResults.add(data);
      }
    }

    return movieResults;
  }

  Future<List<MovieData>> _getMoviesByName(String query) async {
    List<MovieData> movieResults = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('movie')
        .select('*,  genres:genre(name)')
        .textSearch('name', query);

    for (var result in dbResultList) {
      MovieData movie = MovieData.fromJson(result);
      movieResults.add(movie);
    }

    if (movieResults.isEmpty) {
      List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
          .from('movie')
          .select('*,  genres:genre(name)')
          .ilike('name', '$query%');

      for (var result in dbResultList) {
        MovieData movie = MovieData.fromJson(result);
        movieResults.add(movie);
      }
    }

    return movieResults;
  }
}
