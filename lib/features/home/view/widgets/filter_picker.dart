import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/view/models/filter_data.dart';
import 'package:flutter_application/features/home/view/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterPicker extends ConsumerStatefulWidget {
  final Set<String> filters;
  final FilterType type;
  final bool isSingleValue;
  final double? elevation;
  const FilterPicker({
    super.key,
    required this.filters,
    required this.type,
    required this.isSingleValue,
    this.elevation,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterPickerState();
}

class _FilterPickerState extends ConsumerState<FilterPicker> {
  Set<String> currentFilters = <String>{};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children:
            widget.filters.map((String filter) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FilterChip.elevated(
                  elevation: widget.elevation ?? 1,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: EdgeInsets.symmetric(horizontal: 3),
                  visualDensity: VisualDensity.standard,
                  label: Text(filter),
                  selected: currentFilters.contains(filter),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        ref.read(movieFiltersProvider.notifier).addFilter(filter, widget.type);
                        if (widget.isSingleValue) currentFilters.clear();
                        currentFilters.add(filter);
                      } else {
                        ref.read(movieFiltersProvider.notifier).removeFilter(filter, widget.type);
                        currentFilters.remove(filter);
                      }
                    });
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}
