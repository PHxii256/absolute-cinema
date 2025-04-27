import 'dart:developer';
import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/viewmodel/movie_filter_utils.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'movies_notifier.g.dart';

enum InitMovieData { screening, all, comingSoon, airingThisWeek }

@Riverpod(keepAlive: true)
class Movies extends _$Movies {
  List<MovieData> _initialData = [];
  final Map<int, List<DateTime>> _screeningTimesamps = {};

  @override
  Future<List<MovieData>> build(InitMovieData initData) async {
    if (_initialData.isEmpty) {
      await initializeData(initData);
    }
    final filterData = ref.watch(movieFiltersProvider);
    return getFilteredMovies(_initialData, filterData);
  }

  Future<void> initializeData(InitMovieData initData) async {
    if (initData == InitMovieData.all || initData == InitMovieData.comingSoon) {
      final data = await getAllMovies();
      if (initData == InitMovieData.comingSoon) {
        _initialData = comingSoon(data);
      } else {
        _initialData = data;
      }
    }

    if (initData == InitMovieData.screening || initData == InitMovieData.airingThisWeek) {
      final data = await getAllScreeningMovies();
      if (initData == InitMovieData.airingThisWeek) {
        final data = await getAllScreeningMovies();
        _initialData = airingThisWeek(data);
      } else {
        _initialData = data;
      }
    }
  }

  Future<List<MovieData>> getAllScreeningMovies() async {
    final resList = await Supabase.instance.client.from('movie_screening').select('*,movie(*, genres:genre(name))');
    return airingThisWeek(_parseScreeningMoviesJson(resList));
  }

  Future<List<MovieData>> getAllMovies() async {
    try {
      final resList = await Supabase.instance.client.from('movie').select('*, genres:genre(name))');
      return comingSoon(_parseAllMoviesJson(resList));
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  List<MovieData> airingThisWeek(List<MovieData> movieData) {
    List<MovieData> airingThisWeek = [];
    for (var movieData in movieData) {
      if (isReleased(movieData) && _isAiringThisWeek(movieData)) airingThisWeek.add(movieData);
    }
    return airingThisWeek;
  }

  List<MovieData> comingSoon(List<MovieData> movieData) {
    List<MovieData> comingSoonMovies = [];
    for (var movieData in movieData) {
      final dayDiff = movieData.releaseDate.difference(DateTime.now()).inDays;
      if (dayDiff > 0 && dayDiff < 30) {
        comingSoonMovies.add(movieData);
      }
    }

    return comingSoonMovies;
  }

  bool isReleased(MovieData data) {
    final dayDiff = data.releaseDate.difference(DateTime.now()).inDays;
    if (dayDiff <= 0) return true;
    return false;
  }

  bool _isAiringThisWeek(MovieData data) {
    if (!_screeningTimesamps.containsKey(data.id)) return false;
    DateTime firstTimestamp = _screeningTimesamps[data.id]!.first;

    for (var timestamp in _screeningTimesamps[data.id]!) {
      timestamp.isBefore(firstTimestamp);
    }

    if (firstTimestamp.difference(DateTime.now()).inDays <= 7) return true;

    return false;
  }

  List<MovieData> _parseAllMoviesJson(List<Map<String, dynamic>> json) {
    final List<MovieData> movieDataList = [];
    try {
      for (var res in json) {
        final movieData = MovieData.fromJson(res);
        movieDataList.add(movieData);
      }
    } catch (e) {
      log(e.toString());
    }
    return movieDataList;
  }

  List<MovieData> _parseScreeningMoviesJson(List<Map<String, dynamic>> json) {
    final List<MovieData> movieDataList = [];
    try {
      for (var res in json) {
        final movieData = MovieData.fromJson(res["movie"]);
        final movieId = res["movie"]["id"];
        final timestamp = DateTime.parse(res["airing_timestamp"]);

        _screeningTimesamps.update(
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
}
