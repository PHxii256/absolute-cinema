import 'package:flutter/material.dart';
import '../pages/movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final String movieName;
  final String description;
  final String director;
  final DateTime releaseDate;
  final double rating;

  const MoviePoster({
    required this.imageUrl,
    required this.movieName,
    required this.description,
    required this.director,
    required this.releaseDate,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MovieDetailsPage(
                    imageUrl: imageUrl,
                    movieName: movieName,
                    description: description,
                    director: director,
                    releaseDate: _formatDate(releaseDate),
                    rating: rating,
                  ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageUrl, width: 120 * 2, height: 180 * 2, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Helper function to format DateTime as a string
  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
