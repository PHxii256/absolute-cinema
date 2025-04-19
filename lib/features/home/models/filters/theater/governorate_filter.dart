import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';

class GovernorateFilter implements AbstractFilter {
  GovernorateFilter(this.defaultSet);

  @override
  Set<String> defaultSet = {};

  @override
  Set<String> addFilter(AbstractFilter filter, String newString) {
    filter.currentSet.clear();
    filter.currentSet.add(newString);
    return filter.currentSet;
  }

  @override
  final Set<String> currentSet = {};
}
