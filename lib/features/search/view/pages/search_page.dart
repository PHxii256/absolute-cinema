import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/view/widgets/search_results.dart';
import 'package:flutter_application/features/search/viewmodel/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      child: Column(
        children: [
          SearchBar(
            onChanged: (value) {
              ref.read(queryProvider.notifier).state = value;
            },
            controller: myController,
            hintText: "Search for a movie or a theater",
            hintStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(color: Colors.black45)),
            trailing: <Widget>[
              IconButton(
                onPressed: () => {ref.read(queryProvider.notifier).state = myController.value.text},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          SearchResults(),
        ],
      ),
    );
  }
}
