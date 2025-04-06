import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_notifier.dart';
import 'package:flutter_application/features/home/view/widgets/movie_poster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiringMovies extends ConsumerWidget {
  const AiringMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieScreeningsThisWeek = ref.watch(movieScreeningsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Airing This Week',
                style: TextStyle(color: const Color.fromARGB(146, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See All', style: TextStyle(color: Colors.black38, fontSize: 16)),
              ),
            ],
          ),
          switch (movieScreeningsThisWeek) {
            AsyncData(:final value) => SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                itemBuilder: (BuildContext context, int i) {
                  return MoviePoster(
                    movieName: value[i].name,
                    description: value[i].description,
                    rating: value[i].rating.toString(),
                    director: value[i].director ?? "Not Specefied",
                    releaseDate: value[i].releaseDate,
                    url: value[i].posterUrl,
                    genres: value[i].genres ?? [],
                  );
                },
              ),
            ),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          },
        ],
      ),
    );
  }
}
