import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String? url;
  final String movieName;
  final String description;
  final String director;
  final String releaseDate;
  final String rating;
  final List<String> genres;

  const MovieDetailsPage({
    required this.url,
    required this.movieName,
    required this.description,
    required this.director,
    required this.releaseDate,
    required this.rating,
    required this.genres,
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
                SizedBox(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        url != null
                            ? Image.network(url!)
                            : Center(child: Text("Poster Not Found", style: TextStyle(color: Colors.white))),
                  ),
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
                      Text("$genres", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
                      const SizedBox(height: 4),
                      Text("Director: $director", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      Text("Release Date: $releaseDate", style: const TextStyle(fontSize: 16, color: Colors.white70)),
                      const SizedBox(height: 1),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 20),
                          const SizedBox(width: 5),
                          Text(rating, style: const TextStyle(fontSize: 16, color: Colors.white)),
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
