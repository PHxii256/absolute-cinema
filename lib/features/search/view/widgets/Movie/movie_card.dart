import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

class MovieCard extends ConsumerWidget {
  final MovieData movieData;
  const MovieCard({super.key, required this.movieData});

  String getDuration(int minutes) {
    final int hours = (minutes / 60).toInt();
    final double remainderMinutes = (minutes / 60 - hours) * 60;
    return "${hours}h ${remainderMinutes.round()}m";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movieData.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text("${movieData.genres}", style: TextStyle(fontStyle: FontStyle.italic)),
                        ReadMoreText(
                          "Description: ${movieData.description}",
                          trimMode: TrimMode.Length,
                          trimLength: 40,
                          trimLines: 2,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text("Language: ${movieData.primaryLanguage}"),
                        Text(
                          "Subtitles: ${movieData.subtitleLanguage.toString().substring(1, movieData.subtitleLanguage.toString().length - 1)}",
                        ),
                        Text("Age Rating: ${movieData.ageRatingMin.toString()}+"),
                        Text("Review Rating: ${movieData.rating.toString()}/10"),
                        Text("Duration: ${getDuration(movieData.durationMinutes)}"),
                        movieData.director != null ? Text("Director: ${movieData.director}") : Container(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child:
                      movieData.posterUrl != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(movieData.posterUrl!),
                          )
                          : Center(
                            child: Text(
                              "image",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black26),
                            ),
                          ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
