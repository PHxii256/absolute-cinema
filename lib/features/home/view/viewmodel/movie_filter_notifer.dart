import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_filter_notifer.g.dart';

@riverpod
class MovieFilters extends _$MovieFilters {
  final _currentFilters = FilterData.newData();

  @override
  FilterData build() {
    return _currentFilters;
  }

  void resetFilters() {
    final newFilters = FilterData.newData();
    state = newFilters;
  }

  //ugly code warning

  void addFilter(String filter, FilterType type) {
    switch (type) {
      case FilterType.genre:
        _currentFilters.genreFilter.add(filter);
        state = _currentFilters.copyWith(genreFilter: _currentFilters.genreFilter);
        break;
      case FilterType.language:
        _currentFilters.languageFilter.add(filter);
        state = _currentFilters.copyWith(languageFilter: _currentFilters.languageFilter);
        break;
      case FilterType.age:
        _currentFilters.ageFilter.clear();
        _currentFilters.ageFilter.add(filter);
        state = _currentFilters.copyWith(ageFilter: _currentFilters.ageFilter);
        break;
    }
  }

  void removeFilter(String filter, FilterType type) {
    switch (type) {
      case FilterType.genre:
        _currentFilters.genreFilter.remove(filter);
        state = _currentFilters.copyWith(ageFilter: _currentFilters.genreFilter);
        break;
      case FilterType.language:
        _currentFilters.languageFilter.remove(filter);
        state = _currentFilters.copyWith(languageFilter: _currentFilters.languageFilter);
        break;
      case FilterType.age:
        _currentFilters.ageFilter.remove(filter);
        state = _currentFilters.copyWith(ageFilter: _currentFilters.ageFilter);
        break;
    }
  }
}
