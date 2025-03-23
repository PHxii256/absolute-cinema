import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'movie_search_notifier.g.dart';

@riverpod
class MovieSearch extends _$MovieSearch {
  @override
  Future<List<MovieData>> build() async {
    return [];
  }

  Future<void> searchQuery(String query) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return _getSearchResults(query);
    });
  }

  Future<List<MovieData>> _getSearchResults(String query) async {
    List<MovieData> movieResults = [];
    List<Map<String, dynamic>> dbResultList = await Supabase.instance.client
        .from('movie')
        .select()
        .textSearch('name', query);
    for (var result in dbResultList) {
      MovieData movie = MovieData.fromJson(result);
      movieResults.add(movie);
    }
    return movieResults;
  }
}
