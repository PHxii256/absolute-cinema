import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  const Legend({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 14,
      children: [
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 2.75),
                  child: SizedBox.square(dimension: 10, child: ColoredBox(color: const Color.fromARGB(255, 45, 0, 0))),
                ),
              ),
              TextSpan(text: "Occupied", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 2.75),
                  child: SizedBox.square(
                    dimension: 10,
                    child: ColoredBox(color: const Color.fromARGB(255, 101, 12, 12)),
                  ),
                ),
              ),
              TextSpan(text: "Reserved", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 2.75),
                  child: SizedBox.square(dimension: 10, child: ColoredBox(color: Colors.red)),
                ),
              ),
              TextSpan(text: "Available", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}
