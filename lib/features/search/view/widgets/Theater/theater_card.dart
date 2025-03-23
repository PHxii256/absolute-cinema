import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/features/reservation/view/pages/booking_page.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/model/theater_data.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TheaterCard extends ConsumerStatefulWidget {
  final MovieAiringInfo airingInfo;
  const TheaterCard({super.key, required this.airingInfo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TheaterCardState();
}

class _TheaterCardState extends ConsumerState<TheaterCard> {
  String? chosenDay;
  String? chosenTime;

  List<String> getAiringDays() {
    final days = <String>[];
    for (var timestamp in widget.airingInfo.airingTimestamps) {
      final day = DateFormat.EEEE().format(timestamp);
      if (!days.contains(day)) days.add(day);
    }
    return days;
  }

  List<String> getAiringTimes() {
    final times = <String>[];
    for (var timestamp in widget.airingInfo.airingTimestamps) {
      times.add(DateFormat.jm().format(timestamp).toString());
    }
    return times;
  }

  String getLocation() {
    return "${widget.airingInfo.governorateName}, ${widget.airingInfo.areaName}, ${widget.airingInfo.streetName}";
  }

  void copyToClipboard(String text) async {
    if (text.isNotEmpty) {
      try {
        await Clipboard.setData(ClipboardData(text: text));
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(duration: Duration(milliseconds: 600), content: Text('Copied to Clipboard!')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(duration: Duration(milliseconds: 600), content: Text('Failed to copy to clipboard.')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TheaterData theaterData = widget.airingInfo.getTheaterData();

    return Card(
      child: Expanded(
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
                          Text(
                            widget.airingInfo.theaterName,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
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
                              copyToClipboard(widget.airingInfo.gMapsLink);
                            },
                            child: Text(
                              "Google Maps: ${widget.airingInfo.gMapsLink}",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 2),
                          (chosenTime != null && chosenDay != null)
                              ? TextButton.icon(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(50, 30)),
                                icon: Icon(Icons.calendar_month),
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).push(MaterialPageRoute(builder: (context) => const BookingPage()));
                                },
                                label: Text("Pick a seat", style: TextStyle(fontWeight: FontWeight.bold)),
                              )
                              : TextButton.icon(
                                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(50, 30)),
                                icon: Icon(Icons.calendar_month, color: Colors.black26),
                                onPressed: null,
                                label: Text("Pick a seat", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
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
              ChoicePicker(
                onChange: (value) {
                  setState(() {
                    chosenDay = value;
                  });
                },
                choices: getAiringDays(),
              ),
              ChoicePicker(
                onChange: (value) {
                  setState(() {
                    chosenTime = value;
                  });
                },
                choices: getAiringTimes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
