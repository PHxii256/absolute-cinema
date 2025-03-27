import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String imageUrl;
  final String movieName;
  final String description;
  final String director;
  final String releaseDate;
  final double rating;

  const MovieDetailsPage({
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
    return Scaffold(
      appBar: AppBar(title: Text(movieName), backgroundColor: Color(0xff839788)),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imageUrl, width: 120, height: 180, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieName,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text("Director: $director", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      const SizedBox(height: 5),
                      Text("Release Date: $releaseDate", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 20),
                          const SizedBox(width: 5),
                          Text(rating.toString(), style: const TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Description Section
            const Text(
              "Description:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(description, style: const TextStyle(fontSize: 16, color: Colors.white70)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
