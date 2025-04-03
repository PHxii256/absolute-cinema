import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'theater_search_notifier.g.dart';

@riverpod
class TheaterSearch extends _$TheaterSearch {
  @override
  Future<List<MovieAiringInfo>> build() async {
    final movies = ref.watch(movieSearchProvider);
    switch (movies) {
      case AsyncData(:final value):
        {
          searchTheater(movieId: value.first.id);
        }
    }

    return [];
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
}
