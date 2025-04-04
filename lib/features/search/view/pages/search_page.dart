import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/Movie/movie_results.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends ConsumerState<SearchPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          SearchBar(
            onSubmitted: (value) {
              ref.read(queryProvider.notifier).update((prev) => value);
              ref.read(movieSearchProvider.notifier).searchQuery(value);
            },
            controller: myController,
            hintText: "Search for a movie or a theater",
            hintStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(color: Colors.black45)),
            trailing: <Widget>[
              IconButton(
                onPressed: () {
                  ref.read(queryProvider.notifier).update((prev) => myController.text);
                  ref.read(movieSearchProvider.notifier).searchQuery(myController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          SizedBox(height: 12),
          SingleChildScrollView(child: MovieResults()),
        ],
      ),
    );
  }
}
