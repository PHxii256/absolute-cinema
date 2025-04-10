import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_results.dart';

class MovieDetailsPage extends StatelessWidget {
  final MovieData data;
  const MovieDetailsPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    String getReleaseDate() => "${data.releaseDate.year}-${data.releaseDate.month}-${data.releaseDate.day}";

    Widget buildCastAvatar(String name, String role) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            CircleAvatar(radius: 24, child: Icon(Icons.person)),
            SizedBox(height: 4),
            Text(name, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            Text(role, style: TextStyle(fontSize: 11)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(data.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        data.posterUrl != null
                            ? Image.network(data.posterUrl!)
                            : Center(child: Text("Poster Not Found")),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      data.genres != null && data.genres!.isNotEmpty
                          ? Text("${data.genres}", style: TextStyle(fontStyle: FontStyle.italic))
                          : Container(),
                      const SizedBox(height: 4),
                      Text(
                        "Director: ${data.director ?? "not specified"}",
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      Text(
                        "Release Date: ${getReleaseDate()}",
                        style: const TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 1),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            data.rating != null ? data.rating.toString() : "not rated",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            // Description Section
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.description, style: const TextStyle(fontSize: 16, color: Colors.black54)),
                SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    SizedBox(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          buildCastAvatar("Bombardero", "Director"),
                          buildCastAvatar("Tralalero", "Writer"),
                          buildCastAvatar("Tun Sahur", "Actor"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Theaters Airing ${data.name} This Week",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            TheaterResults(movieId: data.id),
          ],
        ),
      ),
    );
  }
}
