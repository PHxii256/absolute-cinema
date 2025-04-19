import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/movie/age_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/category_filter.dart';
import 'package:flutter_application/features/home/models/filters/movie/language_filter.dart';
import 'package:flutter_application/features/home/view/widgets/filters/filter_viewer.dart';
import 'package:flutter_application/features/home/view/widgets/filters/movie_filter_picker.dart';
import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePicker extends ConsumerWidget {
  final Set<String> filters;
  final String title;
  const HomePicker({super.key, required this.title, required this.filters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(movieFiltersProvider);

    int activeFiltersCount() {
      int filterCount = 0;
      for (var entry in provider.entries) {
        if (entry.value.isNotEmpty) filterCount++;
      }
      return filterCount;
    }

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
                        child: FiltersViewer(
                          filterMap: {
                            "Language": MovieFilterPicker(filter: LanguageFilter()),
                            "Age Rating": MovieFilterPicker(filter: AgeFilter()),
                          },
                        ),
                      );
                    },
                  );
                },
                child: Badge(
                  label: Text(activeFiltersCount().toString()),
                  padding: EdgeInsets.all(1),
                  isLabelVisible: activeFiltersCount() > 0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  alignment: AlignmentDirectional.topStart,
                  offset: Offset(-24, 3.5),
                  child: Text('Filters', style: TextStyle(color: Colors.black38, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: MovieFilterPicker(filter: CategoryFilter(), elevation: 0),
        ),
      ],
    );
  }
}
