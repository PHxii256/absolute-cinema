import 'package:flutter_application/features/home/view/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_utils.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movies_notifier.g.dart';

@Riverpod(keepAlive: true)
class Movies extends _$Movies {
  List<MovieData> _initialData = [];

  @override
  Future<List<MovieData>> build() async {
    if (_initialData.isEmpty) {
      _initialData = await MovieScreeningsUtils.getAllMovies();
    }
    final filterData = ref.watch(movieFiltersProvider);
    return MovieScreeningsUtils.getFilteredMovies(_initialData, filterData);
  }
}
