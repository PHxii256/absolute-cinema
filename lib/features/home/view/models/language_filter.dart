import 'package:flutter_application/features/home/view/models/abstract_filter.dart';

class LanguageFilter implements AbstractFilter {
  @override
  final Set<String> defaultSet = {"English", "Arabic", "Japanese", "French"};

  @override
  Set<String> addFilter(AbstractFilter filter, String newString) {
    filter.currentSet.add(newString);
    return filter.currentSet;
  }

  @override
  final Set<String> currentSet = {};
}
