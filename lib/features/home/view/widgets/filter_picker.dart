import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/viewmodel/movie_filter_notifer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterPicker extends ConsumerStatefulWidget {
  final AbstractFilter filter;
  final double? elevation;
  const FilterPicker({super.key, required this.filter, this.elevation});

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
            widget.filter.defaultSet.map((String filterString) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: FilterChip.elevated(
                  elevation: widget.elevation ?? 1,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  labelPadding: EdgeInsets.symmetric(horizontal: 3),
                  visualDensity: VisualDensity.standard,
                  label: Text(filterString),
                  selected: currentFilters.contains(filterString),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        currentFilters = ref.read(movieFiltersProvider.notifier).addFilter(widget.filter, filterString);
                      } else {
                        currentFilters = ref
                            .read(movieFiltersProvider.notifier)
                            .removeFilter(widget.filter, filterString);
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
