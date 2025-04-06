import 'package:flutter/material.dart';
import '../pages/movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  final String movieName;
  final String description;
  final String director;
  final DateTime releaseDate;
  final String rating;
  final String? url;
  final List<String> genres;

  const MoviePoster({
    required this.movieName,
    required this.description,
    required this.director,
    required this.releaseDate,
    required this.rating,
    required this.url,
    required this.genres,
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
                    url: url,
                    movieName: movieName,
                    description: description,
                    director: director,
                    releaseDate: _formatDate(releaseDate),
                    rating: rating,
                    genres: genres,
                  ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: url != null ? Image.network(url!) : Center(child: Text("Poster Not Found")),
        ),
      ),
    );
  }

  // ✅ Helper function to format DateTime as a string
  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
