import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_card.dart';
import 'package:flutter_application/features/search/viewmodel/theater_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheaterResults extends ConsumerWidget {
  const TheaterResults({super.key});

  List<Widget> getCards(List<MovieAiringInfo> airingInfoList) {
    // only add card if contents are unique
    List<Widget> cards = [];
    Map<int, List<MovieAiringInfo>> theaterIdIndexes = {};
    for (var i = 0; i < airingInfoList.length; i++) {
      theaterIdIndexes.update(
        airingInfoList[i].theaterId,
        (value) => [...value, airingInfoList[i]],
        ifAbsent: () => [airingInfoList[i]],
      );
    }
    for (var entry in theaterIdIndexes.entries) {
      cards.add(TheaterCard(airingInfo: entry.value));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<MovieAiringInfo>> theaterData = ref.watch(theaterSearchProvider);
    return Container(
      child: switch (theaterData) {
        AsyncData(:final value) => value.isNotEmpty ? Column(children: getCards(value)) : Container(),
        AsyncError() => Text('Oops, something unexpected happened'),
        _ => Center(child: SizedBox(width: 40, height: 40, child: const CircularProgressIndicator())),
      },
    );
  }
}
