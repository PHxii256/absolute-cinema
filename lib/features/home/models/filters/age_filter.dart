import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';

class AgeFilter implements AbstractFilter {
  @override
  final Set<String> defaultSet = {'0', '12', '13', '16', '17', '18', '21'};

  @override
  Set<String> addFilter(AbstractFilter filter, String newString) {
    filter.currentSet.clear();
    filter.currentSet.add(newString);
    return filter.currentSet;
  }

  Set<String> getAgeFilterText() {
    return defaultSet.map((f) => f == "0" ? "Everyone" : "$f+").toSet();
  }

  static int getAgeFilterInt(String ageFilter) {
    return ageFilter == "Everyone" ? 0 : int.tryParse(ageFilter.substring(0, 2)) ?? 0;
  }

  @override
  final Set<String> currentSet = {};
}
