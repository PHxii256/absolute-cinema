import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/movie_poster.dart';

class TrendingMovieRow extends StatelessWidget {
  const TrendingMovieRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Movies Trending Today',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16)),
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
    );
  }
}
