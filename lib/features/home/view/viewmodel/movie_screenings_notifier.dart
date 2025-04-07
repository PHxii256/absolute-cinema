import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'movie_screenings_notifier.g.dart';

@Riverpod(keepAlive: true)
class MovieScreenings extends _$MovieScreenings {
  final List<MovieData> _initialData = [];
  final Set<String> _currentGenreFilters = {};

  @override
  Future<List<MovieData>> build() async {
    return await getAllMoviesAiringThisWeek();
  }

  Future<List<MovieData>> getAllMoviesAiringThisWeek() async {
    final List<MovieData> movieDataList = [];
    final weekFromNow = DateTime.now().add(Duration(days: 7));
    final resList = await Supabase.instance.client
        .from('movie_screening')
        .select('movie(*, genres:genre(name))')
        .lte('airing_timestamp', weekFromNow)
        .gte('airing_timestamp', DateTime.now());

    for (var res in resList) {
      movieDataList.add(MovieData.fromJson(res["movie"]));
    }

    _initialData.addAll(movieDataList);
    return getFilteredMovies(movieDataList);
  }

  Future<List<MovieData>> getAllMoviesComingSoon() async {
    final List<MovieData> movieDataList = [];
    final monthFromNow = DateTime.now().add(Duration(days: 30));
    final resList = await Supabase.instance.client
        .from('movie')
        .select()
        .lte('release_date', monthFromNow)
        .gte('release_date', DateTime.now());

    for (var res in resList) {
      movieDataList.add(MovieData.fromJson(res));
    }

    _initialData.addAll(movieDataList);
    return getFilteredMovies(movieDataList);
  }

  List<MovieData> getFilteredMovies(List<MovieData> movieDataList) {
    if (_currentGenreFilters.isNotEmpty) {
      return movieDataList.where((movie) {
        if (movie.genres == null) return true;
        if (movie.genres!.toSet().containsAll(_currentGenreFilters)) return true;
        return false;
      }).toList();
    } else {
      return _initialData;
    }
  }

  void addFilter(String filter) {
    if (state.isLoading || state.hasError) return;
    _currentGenreFilters.add(filter);
    state = AsyncValue.data(getFilteredMovies([...state.value!]));
  }

  void removeFilter(String filter) {
    if (state.isLoading || state.hasError) return;
    _currentGenreFilters.remove(filter);
    state = AsyncValue.data(getFilteredMovies([...state.value!]));
  }
}
