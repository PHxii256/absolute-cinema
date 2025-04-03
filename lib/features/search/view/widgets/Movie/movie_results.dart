import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:flutter_application/features/search/view/widgets/Movie/movie_card.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_results.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieResults extends ConsumerWidget {
  const MovieResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MovieData>> searchResultList = ref.watch(movieSearchProvider);
    final query = ref.watch(queryProvider);

    return Container(
      child: switch (searchResultList) {
        AsyncData(:final value) =>
          value.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieCard(movieData: value.first),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 12, 0, 4),
                    child: Text(
                      "Theaters Airing ${value.first.name} This Week:",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black26),
                    ),
                  ),
                  TheaterResults(),
                ],
              )
              : query != ""
              ? Text("nothing found :/")
              : Container(),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
      },
    );
  }
}
