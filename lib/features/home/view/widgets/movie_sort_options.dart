import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSortOptions extends ConsumerWidget {
  const MovieSortOptions({super.key});

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
              ref.read(movieSearchProvider.notifier).sortByRatingAsc();
            },
            child: Text("Sort By Rating Ascending"),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(movieSearchProvider.notifier).sortByRatingDesc();
            },
            child: Text("Sort By Rating Descending"),
          ),
        ],
      ),
    );
  }
}
