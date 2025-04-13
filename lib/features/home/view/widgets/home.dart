import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/models/category_filter.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_application/features/home/view/viewmodel/movies_notifier.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_utils.dart';
import 'package:flutter_application/features/home/view/widgets/home_picker.dart';
import 'package:flutter_application/features/search/view/widgets/Movie/search_widget.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_carousel.dart';

class NowAiring extends ConsumerWidget {
  const NowAiring({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(queryProvider);
    final allScreeningMovies = ref.watch(moviesProvider);
    final filters = ref.watch(movieFiltersProvider);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(children: [Text(filters.toString(), style: TextStyle(fontSize: 18))]),
        ),
        SearchWidget(),
        query.isEmpty
            ? Column(
              children: [
                HomePicker(title: "Categories", filters: CategoryFilter().defaultSet),
                MoviesCarousel(title: 'Airing This Week', asyncMovieList: releasedMovies(allScreeningMovies)),
                MoviesCarousel(title: 'Coming Soon', asyncMovieList: comingSoon(allScreeningMovies)),
              ],
            )
            : Container(),
      ],
    );
  }
}
