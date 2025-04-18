import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/viewmodel/movie_screenings_utils.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_notifier.g.dart';

@Riverpod(keepAlive: true)
class Movies extends _$Movies {
  List<MovieData> _initialData = [];

  @override
  Future<List<MovieData>> build() async {
    if (_initialData.isEmpty) {
      _initialData = await getAllMovies();
    }
    final filterData = ref.watch(movieFiltersProvider);
    return getFilteredMovies(_initialData, filterData);
  }
}
