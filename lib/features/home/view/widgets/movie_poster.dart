import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/model/movie_data.dart';
import '../pages/movie_details_page.dart';

class MoviePoster extends StatelessWidget {
  final MovieData data;

  const MoviePoster({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage(data: data)));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              data.posterUrl != null
                  ? Image.network(
                    data.posterUrl!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(height: 300, width: 200, child: Card());
                    },
                  )
                  : Center(child: Text("Poster Not Found")),
        ),
      ),
    );
  }
}
