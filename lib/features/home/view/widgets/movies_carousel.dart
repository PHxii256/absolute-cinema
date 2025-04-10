import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/movie_poster.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesCarousel extends ConsumerWidget {
  final String title;
  final AsyncValue<List<MovieData>> asyncMovieList;
  const MoviesCarousel({super.key, required this.title, required this.asyncMovieList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: const Color.fromARGB(146, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: switch (asyncMovieList) {
              AsyncData(:final value) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                itemBuilder: (BuildContext context, int i) {
                  return MoviePoster(data: value[i]);
                },
              ),
              AsyncError() => const Text('Oops, something unexpected happened'),
              _ => Container(),
            },
          ),
        ],
      ),
    );
  }
}
