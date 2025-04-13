import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/models/category_filter.dart';
import 'package:flutter_application/features/home/view/widgets/filters_viewer.dart';
import 'package:flutter_application/features/home/view/widgets/filter_picker.dart';

class HomePicker extends StatelessWidget {
  final Set<String> filters;
  final String title;
  const HomePicker({super.key, required this.title, required this.filters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: const Color.fromARGB(146, 0, 0, 0), fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    barrierColor: const Color.fromARGB(190, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                    ),
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        child: FiltersViewer(),
                      );
                    },
                  );
                },
                child: Text('Filters', style: TextStyle(color: Colors.black38, fontSize: 16)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FilterPicker(filter: CategoryFilter(), elevation: 0),
        ),
      ],
    );
  }
}
