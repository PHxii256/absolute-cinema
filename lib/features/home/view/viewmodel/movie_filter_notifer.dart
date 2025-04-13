import 'dart:developer';
import 'package:flutter_application/features/home/view/models/abstract_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_filter_notifer.g.dart';

@riverpod
class MovieFilters extends _$MovieFilters {
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

  Set<String> getCurrentSet(AbstractFilter filter) => state.containsKey(filter) ? state[filter]! : {};
}
