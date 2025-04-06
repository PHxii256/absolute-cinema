import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/genre_picker.dart';
import 'airing_movies.dart';

class NowAiring extends StatelessWidget {
  const NowAiring({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [GenrePicker(), AiringMovies()]);
  }
}
