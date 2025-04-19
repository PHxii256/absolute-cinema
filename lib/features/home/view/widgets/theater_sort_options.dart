import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/viewmodel/theater_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheaterSortOptions extends ConsumerWidget {
  final int movieId;
  const TheaterSortOptions({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Sort", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              ref.read(theaterSearchProvider(movieId: movieId).notifier).sortByPriceAsc();
            },
            child: Text("Sort By Price Ascending"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(theaterSearchProvider(movieId: movieId).notifier).sortByPriceDesc();
            },
            child: Text("Sort By Price Descending"),
          ),
        ],
      ),
    );
  }
}
