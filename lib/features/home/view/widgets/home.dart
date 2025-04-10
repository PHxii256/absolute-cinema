import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:flutter_application/features/home/view/viewmodel/movies_notifier.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_screenings_di.dart';
import 'package:flutter_application/features/home/view/widgets/home_picker.dart';
import 'package:flutter_application/features/search/view/widgets/Movie/search_widget.dart';
import 'package:flutter_application/features/search/viewmodel/search_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_carousel.dart';

class NowAiring extends ConsumerWidget {
  const NowAiring({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterData = FilterData();
    final query = ref.watch(queryProvider);
    final allScreeningMovies = ref.watch(moviesProvider);

    return ListView(
      children: [
        SearchWidget(),
        query.isEmpty
            ? Column(
              children: [
                HomePicker(title: "Categories", filters: filterData.genreFilter, type: FilterType.genre),
                MoviesCarousel(
                  title: 'Airing This Week',
                  asyncMovieList: MovieScreeningsDI.airingThisWeek(allScreeningMovies),
                ),
                MoviesCarousel(title: 'Coming Soon', asyncMovieList: MovieScreeningsDI.comingSoon(allScreeningMovies)),
              ],
            )
            : Container(),
      ],
    );
  }
}
