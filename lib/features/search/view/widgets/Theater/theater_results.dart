import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_card.dart';
import 'package:flutter_application/features/search/viewmodel/theater_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheaterResults extends ConsumerWidget {
  const TheaterResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MovieAiringInfo>> theaterData = ref.watch(theaterSearchProvider);
    return Container(
      child: switch (theaterData) {
        AsyncData(:final value) =>
          value.isNotEmpty
              ? Column(
                children: List.generate(
                  value.length,
                  (i) => TheaterCard(key: ValueKey(i.toString()), airingInfo: value[i]),
                ),
              )
              : Container(),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
      },
    );
  }
}
