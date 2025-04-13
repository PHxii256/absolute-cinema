abstract class AbstractFilter {
  final Set<String> defaultSet = {};
  final Set<String> currentSet = {};
  Set<String> addFilter(AbstractFilter filter, String newString);
}
