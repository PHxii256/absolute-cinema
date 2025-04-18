import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/allow_snacks_filter.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theater_filter_notifer.g.dart';

@riverpod
class TheaterFilters extends _$TheaterFilters {
  @override
  Map<AbstractFilter, Set<String>> build() {
    return {};
  }

  Set<String> addFilter(AbstractFilter filter, String newString) {
    final updatedSet = _updateFilter(filter, newString);
    if (updatedSet.isEmpty) {
      state[filter] = filter.addFilter(filter, newString);
      state = Map.from(state);
      return state[filter] ?? {};
    }
    return updatedSet;
  }

  Set<String> _updateFilter(AbstractFilter filter, String newString) {
    for (var element in state.keys) {
      if (element.runtimeType == filter.runtimeType) {
        state[element] = filter.addFilter(element, newString);
        state = Map.from(state);
        return state[element] ?? {};
      }
    }
    return {};
  }

  Set<String> removeFilter(AbstractFilter filter, String newString) {
    AbstractFilter? modifiedKey;

    for (var element in state.entries) {
      if (element.value.contains(newString)) {
        modifiedKey = element.key;
        element.value.remove(newString);
      }
    }

    state = Map.from(state);
    return state[modifiedKey] ?? {};
  }

  void resetFilters() => state = {};

  Set<String> getCurrentSet(AbstractFilter filter) {
    for (var entry in state.entries) {
      if (entry.key.defaultSet.containsAll(filter.defaultSet)) return entry.value;
    }
    return {};
  }

  List<MovieAiringInfo> getFilteredMovies(
    List<MovieAiringInfo> initialData,
    Map<AbstractFilter, Set<String>> currentFilters,
  ) {
    if (initialData.isNotEmpty) {
      return initialData.where((movie) {
        if (allFiltersMatch(movie, currentFilters)) return true;
        return false;
      }).toList();
    } else {
      return initialData;
    }
  }

  bool allFiltersMatch(MovieAiringInfo airingInfo, Map<AbstractFilter, Set<String>> currentFilters) {
    for (var entry in currentFilters.entries) {
      if (entry.value.isEmpty) break;
      if (entry.key is AllowSnacksFilter) {
        if (airingInfo.allowsSnacks != AllowSnacksFilter.allowSnacks(entry.value)) return false;
      }
    }
    return true;
  }
}
