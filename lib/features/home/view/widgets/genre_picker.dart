import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_notifier.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
}
