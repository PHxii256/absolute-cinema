import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/movie_poster.dart';

class TrendingMovieRow extends StatelessWidget {
  const TrendingMovieRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
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
                    'Airing Today',
                    style: TextStyle(
                      color: const Color.fromARGB(169, 0, 0, 0),
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
                  MoviePoster(
                    imageUrl: 'assets/fightClubPoster.jpg',
                    movieName: 'fight club',
                    description: '...',
                    rating: 5.0,
                    director: '...',
                    releaseDate: DateTime(2010),
                  ),
                  MoviePoster(
                    imageUrl: 'assets/anoraPoster.jpg',
                    movieName: 'anora',
                    description: '...',
                    rating: 5.0,
                    director: '...',
                    releaseDate: DateTime(2010),
                  ),
                  MoviePoster(
                    imageUrl: 'assets/fightClubPoster.jpg',
                    movieName: 'fight club',
                    description: '...',
                    rating: 5.0,
                    director: '...',
                    releaseDate: DateTime(2010),
                  ),
                  MoviePoster(
                    imageUrl: 'assets/fightClubPoster.jpg',
                    movieName: 'fight club',
                    description: '...',
                    rating: 5.0,
                    director: '...',
                    releaseDate: DateTime(2010),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
