import 'package:flutter/material.dart';
import 'package:flutter_application/features/reservation/view/pages/booking_page.dart';
import 'package:flutter_application/features/search/model/theater_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:choice/choice.dart';

class TheaterCard extends ConsumerStatefulWidget {
  final TheaterData theaterData;
  const TheaterCard({super.key, required this.theaterData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TheaterCardState();
}

class _TheaterCardState extends ConsumerState<TheaterCard> {
  List<String> choices = ['10 AM', '12 PM', '2 PM', '4 PM', '6 PM', '8 PM', '10 PM', '12 AM'];

  String? selectedValue;

  void setSelectedValue(String? value) {
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Expanded(
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
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Theater: ${widget.theaterData.theaterName}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "Location: ${widget.theaterData.theaterLocation}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54),
                          ),
                          Text(
                            "Price: ${widget.theaterData.theaterPriceRange}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black54),
                          ),
                          Text(
                            "Outside Snacks: ${widget.theaterData.theaterSnacksPolicy}",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black54),
                          ),
                          SizedBox(height: 6),
                          selectedValue != null
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
                              : Container(),
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
              SizedBox(height: 2),
              Choice<String>.inline(
                clearable: true,
                value: ChoiceSingle.value(selectedValue),
                onChanged: ChoiceSingle.onChanged(setSelectedValue),
                itemCount: choices.length,
                itemBuilder: (state, i) {
                  return ChoiceChip(
                    selected: state.selected(choices[i]),
                    onSelected: state.onSelected(choices[i]),
                    label: Text(choices[i]),
                    labelPadding: EdgeInsets.symmetric(horizontal: 2),
                    visualDensity: VisualDensity.compact,
                  );
                },
                listBuilder: ChoiceList.createScrollable(
                  spacing: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
