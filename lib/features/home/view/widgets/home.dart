import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/movie/category_filter.dart';
import 'package:flutter_application/features/home/viewmodel/movies_notifier.dart';
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
    final screeningMovies = ref.watch(moviesProvider(InitMovieData.screening));
    final comingSoonMovies = ref.watch(moviesProvider(InitMovieData.comingSoon));
    return ListView(
      children: [
        SearchWidget(),
        query.isEmpty
            ? Column(
              children: [
                HomePicker(title: "Categories", filters: CategoryFilter().defaultSet),
                MoviesCarousel(title: 'Airing This Week', asyncMovieList: screeningMovies),
                MoviesCarousel(title: 'Coming Soon', asyncMovieList: comingSoonMovies),
              ],
            )
            : Container(),
      ],
    );
  }
}
