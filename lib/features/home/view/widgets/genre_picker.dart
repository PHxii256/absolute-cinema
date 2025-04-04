import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';

class GenrePicker extends StatelessWidget {
  const GenrePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    color: const Color.fromARGB(169, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All', style: TextStyle(color: Colors.black38, fontSize: 16)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ChoicePicker(
                  choices: ["Action", "Drama", "Comedy", "Romance", "Adventure", "Horror"],
                  onChange: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
