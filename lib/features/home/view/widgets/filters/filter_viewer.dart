import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/widgets/filters/abstract_filter_picker.dart';

class FiltersViewer extends StatelessWidget {
  final Map<String, FilterPicker> filterMap;
  const FiltersViewer({super.key, required this.filterMap});

  List<Widget> getFilters() {
    final List<Widget> filterWidgets = [];
    for (var entry in filterMap.entries) {
      filterWidgets.add(SizedBox(height: 3));
      filterWidgets.add(FilterRow(filterName: entry.key, filterPicker: entry.value));
    }
    return filterWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Filters", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: 4),
          ...getFilters(),
        ],
      ),
    );
  }
}

class FilterRow extends StatelessWidget {
  final String filterName;
  final FilterPicker filterPicker;
  const FilterRow({super.key, required this.filterName, required this.filterPicker});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Text(filterName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Expanded(child: filterPicker),
      ],
    );
  }
}
