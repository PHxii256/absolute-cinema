import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/view/pages/booking_page.dart';
import 'package:flutter_application/features/search/model/movie_airing_info.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TheaterScreeningTimePicker extends ConsumerStatefulWidget {
  final List<MovieAiringInfo> airingInfo;
  const TheaterScreeningTimePicker({super.key, required this.airingInfo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TheaterScreeningTimePickerState();
}

class _TheaterScreeningTimePickerState extends ConsumerState<TheaterScreeningTimePicker> {
  String? chosenDay;
  String? chosenTime;

  List<String> getAiringDays() {
    final days = <String>[];
    for (var airingInfo in widget.airingInfo) {
      final day = DateFormat.EEEE().format(airingInfo.screeningTimestamp);
      if (!days.contains(day)) days.add(day);
    }
    return days;
  }

  List<String> getAiringTimes(String chosenDay) {
    final times = <String>[];
    List<MovieAiringInfo> currntAiringInfoList = [];
    for (var airingInfo in widget.airingInfo) {
      final day = DateFormat.EEEE().format(airingInfo.screeningTimestamp);
      if (day == chosenDay) {
        currntAiringInfoList.add(airingInfo);
      }
    }
    for (var airingInfo in currntAiringInfoList) {
      times.add(DateFormat.jm().format(airingInfo.screeningTimestamp).toString());
    }
    return times;
  }

  int? getChosenScreeningId() {
    for (var airingInfo in widget.airingInfo) {
      if (chosenDay == DateFormat.EEEE().format(airingInfo.screeningTimestamp)) {
        if (chosenTime == DateFormat.jm().format(airingInfo.screeningTimestamp).toString()) {
          return airingInfo.screeningId;
        }
      }
    }
    return null;
  }

  void openSeatsPage() {
    int? chosenScreeningId = getChosenScreeningId();
    if (chosenScreeningId != null && widget.airingInfo.isNotEmpty) {
      final theaterId = widget.airingInfo.first.theaterId;
      final movieId = widget.airingInfo.first.movieId;
      final airingInfo = widget.airingInfo.first.copyWith(screeningId: chosenScreeningId);

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BookingPage(theaterId: theaterId, movieId: movieId, airingInfo: airingInfo),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(4, 4, 0, 0),
          child:
              (chosenTime != null && chosenDay != null)
                  ? TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(Icons.calendar_month),
                    onPressed: openSeatsPage,
                    label: Text("Pick a seat", style: TextStyle(fontWeight: FontWeight.bold)),
                  )
                  : TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(Icons.calendar_month, color: Colors.black26),
                    onPressed: null,
                    label: Text("Pick a seat", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
        ),
        ChoicePicker(
          onChange: (value) {
            setState(() {
              chosenDay = value;
            });
          },
          choices: getAiringDays(),
        ),
        chosenDay != null
            ? ChoicePicker(
              onChange: (value) {
                setState(() {
                  chosenTime = value;
                });
              },
              choices: getAiringTimes(chosenDay!),
            )
            : Container(),
      ],
    );
  }
}
