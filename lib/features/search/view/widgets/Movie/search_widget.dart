import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/movie_sort_options.dart';
import 'package:flutter_application/features/search/viewmodel/movie_search_notifier.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movie_results.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchPage();
}

class _SearchPage extends ConsumerState<SearchWidget> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final queriedText = ref.watch(queryProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: Column(
        children: [
          SearchBar(
            onSubmitted: (value) {
              ref.read(queryProvider.notifier).update((prev) => value);
              ref.read(movieSearchProvider.notifier).searchQuery(value);
            },
            elevation: WidgetStatePropertyAll(0),
            controller: myController,
            hintText: "Enter a movie or an actor's name",
            hintStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(color: Colors.black45)),

            trailing: <Widget>[
              Container(
                width: 40,
                padding: EdgeInsets.all(4),
                child:
                    queriedText.isEmpty
                        ? IconButton(
                          onPressed: () {
                            ref.read(queryProvider.notifier).update((prev) => myController.text);
                            ref.read(movieSearchProvider.notifier).searchQuery(myController.text);
                          },
                          icon: const Icon(Icons.search),
                        )
                        : IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            myController.clear();
                            myController.clearComposing();
                            ref.read(queryProvider.notifier).update((prev) => "");
                          },
                          icon: const Icon(Icons.clear),
                        ),
              ),
              Container(
                width: 50,
                padding: EdgeInsets.all(4),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      barrierColor: const Color.fromARGB(190, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                      ),
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          child: MovieSortOptions(),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.sort),
                ),
              ),
            ],
          ),
          SingleChildScrollView(child: Padding(padding: const EdgeInsets.only(top: 8), child: MovieResults())),
          queriedText.isNotEmpty ? SizedBox(height: 6) : Container(),
        ],
      ),
    );
  }
}
