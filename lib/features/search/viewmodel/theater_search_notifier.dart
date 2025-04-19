import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/allow_snacks_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/area_filter.dart';
import 'package:flutter_application/features/home/models/filters/theater/governorate_filter.dart';
import 'package:flutter_application/features/home/viewmodel/theater_filter_notifer.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'theater_search_notifier.g.dart';

@Riverpod(keepAlive: true)
class TheaterSearch extends _$TheaterSearch {
  List<MovieAiringInfo> _initialData = [];

  @override
  Future<List<MovieAiringInfo>> build({required int movieId}) async {
    final filterData = ref.watch(theaterFiltersProvider);
    if (_initialData.isEmpty) {
      _initialData = await _getSearchResults(movieId);
    }
    return _getFilteredMovies(_initialData, filterData);
  }

  Future<void> searchTheater({required int movieId}) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _getSearchResults(movieId);
    });
  }

  Future<List<MovieAiringInfo>> _getSearchResults(int movieId) async {
    List<MovieAiringInfo> airingResults = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client.rpc(
      'get_theaters_airing_movie',
      params: {'p_movie_id': movieId},
    );
    for (var result in dbResultList) {
      MovieAiringInfo airingInfo = MovieAiringInfo.fromJson(result);
      airingResults.add(airingInfo);
    }
    return airingResults;
  }

  void sortByPriceAsc() {
    if (state.hasValue) {
      final List<MovieAiringInfo> currentList = state.value!;
      currentList.sort((a, b) => a.ticketPrice.compareTo(b.ticketPrice));
      state = AsyncData(currentList);
    }
  }

  void sortByPriceDesc() {
    if (state.hasValue) {
      final List<MovieAiringInfo> currentList = state.value!;
      currentList.sort((b, a) => a.ticketPrice.compareTo(b.ticketPrice));
      state = AsyncData(currentList);
    }
  }

  Set<String> getGovernorates() {
    Set<String> governorateSet = {};
    for (var airingInfo in _initialData) {
      governorateSet.add(airingInfo.governorateName);
    }
    return governorateSet;
  }

  Set<String> getAreas() {
    Set<String> areaSet = {};
    for (var airingInfo in _initialData) {
      areaSet.add(airingInfo.areaName);
    }
    return areaSet;
  }

  bool resultsEmpty() => _initialData.isEmpty;

  List<MovieAiringInfo> _getFilteredMovies(
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
      if (entry.key is GovernorateFilter) {
        if (!entry.value.contains(airingInfo.governorateName)) return false;
      }
      if (entry.key is AreaFilter) {
        if (!entry.value.contains(airingInfo.areaName)) return false;
      }
    }
    return true;
  }
}
