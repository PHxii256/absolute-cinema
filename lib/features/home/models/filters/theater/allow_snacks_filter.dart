import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';

class AllowSnacksFilter implements AbstractFilter {
  @override
  final Set<String> defaultSet = {"Yes", "No"};

  @override
  Set<String> addFilter(AbstractFilter filter, String newString) {
    filter.currentSet.clear();
    filter.currentSet.add(newString);
    return filter.currentSet;
  }

  @override
  final Set<String> currentSet = {};

  static bool allowSnacks(Set<String> set) => set.first == "Yes" ? true : false;
}
