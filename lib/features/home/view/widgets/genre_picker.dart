import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_notifier.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Set<String> genreFilter = {"Action", "Drama", "Comedy", "Romance", "Adventure", "Horror"};

class GenrePicker extends ConsumerStatefulWidget {
  const GenrePicker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenrePickerState();
}

class _GenrePickerState extends ConsumerState<GenrePicker> {
  Set<String> filters = <String>{};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(color: const Color.fromARGB(146, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Filters', style: TextStyle(color: Colors.black38, fontSize: 16)),
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  genreFilter.map((String genre) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        labelPadding: EdgeInsets.symmetric(horizontal: 2),
                        visualDensity: VisualDensity.standard,
                        label: Text(genre),
                        selected: filters.contains(genre),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              ref.read(movieScreeningsProvider.notifier).addFilter(genre);
                              filters.add(genre);
                            } else {
                              ref.read(movieScreeningsProvider.notifier).removeFilter(genre);
                              filters.remove(genre);
                            }
                          });
                        },
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/*
class GenrePicker extends ConsumerWidget {
  const GenrePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: const Color.fromARGB(146, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All', style: TextStyle(color: Colors.black38, fontSize: 16)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChoicePicker(
                  choices: ["Action", "Drama", "Comedy", "Romance", "Adventure", "Horror"],
                  onChange: (value) {
                    ref.read(movieScreeningsProvider.notifier).toggleGenreFilter(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
