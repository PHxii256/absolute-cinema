import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/cast_viewer.dart';
import 'package:flutter_application/features/home/view/widgets/details_page_fab.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_results.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsPage extends ConsumerWidget {
  final MovieData data;
  const MovieDetailsPage({required this.data, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getReleaseDate() => "${data.releaseDate.year}-${data.releaseDate.month}-${data.releaseDate.day}";

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: DetailsPageFab(movieId: data.id, movieName: data.name, movieReleaseDate: data.releaseDate),
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
            const Text("Description:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.description, style: const TextStyle(fontSize: 16, color: Colors.black54)),
                SizedBox(height: 12),
                CastViewer(movieData: data),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 230),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        "Theaters Airing ${data.name} ",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "This Week",
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
