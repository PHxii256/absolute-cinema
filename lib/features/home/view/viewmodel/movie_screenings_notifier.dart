import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'movie_screenings_notifier.g.dart';

@riverpod
class MovieScreenings extends _$MovieScreenings {
  final List<MovieData> _initialData = [];
  String? _currentGenreFilter;

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
    if (movieDataList.isEmpty) {
      movieDataList = _initialData;
    }
    if (_currentGenreFilter != null) {
      return movieDataList.where((movieData) {
        if (movieData.genres == null) return true;
        for (var genre in movieData.genres!) {
          if (_currentGenreFilter!.toLowerCase() == genre.toLowerCase()) return true;
        }
        return false;
      }).toList();
    } else {
      return _initialData;
    }
  }

  void toggleGenreFilter(String? filter) {
    if (state.isLoading || state.hasError) return;
    if (filter != null) {
      _currentGenreFilter = filter;
      state = AsyncValue.data(getFilteredMovies([...state.value!]));
    } else {
      _currentGenreFilter = null;
      final x = getFilteredMovies([...state.value!]);
      state = AsyncValue.data(x);
    }
  }
}
