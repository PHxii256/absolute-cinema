import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';

class CategoryFilter implements AbstractFilter {
  @override
  final Set<String> defaultSet = {"Action", "Drama", "Comedy", "Romance", "Adventure", "Horror"};

  @override
  Set<String> addFilter(AbstractFilter filter, String newString) {
    filter.currentSet.add(newString);
    return filter.currentSet;
  }

  @override
  final Set<String> currentSet = {};
}
