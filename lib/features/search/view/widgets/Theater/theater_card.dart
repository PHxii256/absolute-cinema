import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/model/theater_data.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/theater_screening_time_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheaterCard extends ConsumerWidget {
  final List<MovieAiringInfo> airingInfo;
  const TheaterCard({super.key, required this.airingInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getLocation() {
      if (airingInfo.isNotEmpty) {
        return "${airingInfo.first.governorateName}, ${airingInfo.first.areaName}, ${airingInfo.first.streetName}";
      }
      return "Something went wrong, List Empty :/";
    }

    void copyToClipboard(String text) async {
      if (text.isNotEmpty) {
        try {
          await Clipboard.setData(ClipboardData(text: text));
          if (context.mounted) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(duration: Duration(milliseconds: 600), content: Text('Copied to Clipboard!')));
          }
        } catch (e) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(duration: Duration(milliseconds: 600), content: Text('Failed to copy to clipboard.')),
            );
          }
        }
      }
    }

    TheaterData theaterData;
    if (airingInfo.isNotEmpty) {
      theaterData = airingInfo.first.getTheaterData();
    } else {
      return Text("Something went wrong, List Empty :/");
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(airingInfo.first.theaterName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(
                          "Location: ${getLocation()}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          "Price: ${theaterData.theaterPriceRange}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),
                        ),
                        Text(
                          "Outside Snacks: ${theaterData.theaterSnacksPolicy}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                        ),
                        Text(
                          "Offers Snacks: ${theaterData.offersSnacks}",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          onPressed: () async {
                            copyToClipboard(airingInfo.first.gMapsLink);
                          },
                          child: Text(
                            "Google Maps: ${airingInfo.first.gMapsLink}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                          ),
                        ),
                        SizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    height: 140,
                    width: 140,
                    child: Center(
                      child: Text(
                        "image",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black26),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TheaterScreeningTimePicker(airingInfo: airingInfo),
          ],
        ),
      ),
    );
  }
}
