import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:flutter_application/features/home/view/widgets/filter_picker.dart';

class FiltersViewer extends StatelessWidget {
  const FiltersViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final filterData = FilterData();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text("Filters", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
          SizedBox(height: 4),
          Row(
            spacing: 16,
            children: [
              Text("Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Expanded(
                child: FilterPicker(
                  filters: filterData.languageFilter,
                  type: FilterType.language,
                  isSingleValue: false,
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Row(
            spacing: 16,
            children: [
              Text("Age Rating", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Expanded(
                child: FilterPicker(
                  filters: FilterData.getAgeFilterText(filterData),
                  type: FilterType.age,
                  isSingleValue: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Set<String> getAgeFilterText(FilterData filterData) {
    return filterData.ageFilter;
  }
}
