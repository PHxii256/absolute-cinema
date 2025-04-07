import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:flutter_application/features/search/view/widgets/Movie/movie_card.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieResults extends ConsumerWidget {
  const MovieResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MovieData>> searchResultList = ref.watch(movieSearchProvider);
    final query = ref.watch(queryProvider);

    return query.isNotEmpty
        ? Container(
          child: switch (searchResultList) {
            AsyncData(:final value) =>
              value.isNotEmpty
                  ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (BuildContext context, int index) => MovieCard(movieData: value[index]),
                  )
                  : Text("nothing found :/"),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
          },
        )
        : Container();
  }
}
