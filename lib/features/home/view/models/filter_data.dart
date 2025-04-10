import 'package:equatable/equatable.dart';

class FilterData extends Equatable {
  FilterData.newData() : genreFilter = <String>{}, languageFilter = <String>{}, ageFilter = <String>{};

  const FilterData([
    this.genreFilter = const {"Action", "Drama", "Comedy", "Romance", "Adventure", "Horror"},
    this.languageFilter = const {"English", "Arabic", "Japanese", "French"},
    this.ageFilter = const {'0', '12', '13', '16', '17', '18', '21'}, //over-age n
  ]);

  final Set<String> genreFilter;
  final Set<String> languageFilter;
  final Set<String> ageFilter;

  FilterData copyWith({
    Set<String> genreFilter = const <String>{},
    Set<String> languageFilter = const <String>{},
    Set<String> ageFilter = const <String>{},
  }) {
    return (FilterData(this.genreFilter, this.languageFilter, this.ageFilter));
  }

  static Set<String> getAgeFilterText(FilterData filterData) {
    return filterData.ageFilter.map((f) => f == "0" ? "Everyone" : "$f+").toSet();
  }

  static int getAgeFilterInt(String ageFilter) {
    return ageFilter == "Everyone" ? 0 : int.tryParse(ageFilter.substring(0, 2)) ?? 0;
  }

  @override
  List<Object?> get props => [genreFilter, languageFilter, ageFilter];
}

enum FilterType { genre, language, age }
