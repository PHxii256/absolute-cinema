import 'package:flutter/material.dart';
import 'trending_movie_row.dart';

class NowAiring extends StatelessWidget {
  const NowAiring({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: TrendingMovieRow());
  }
}
