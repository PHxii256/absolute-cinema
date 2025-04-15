import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/models/filters/abstract_filter.dart';
import 'package:flutter_application/features/home/view/widgets/filters/abstract_filter_picker.dart';
import 'package:flutter_application/features/home/viewmodel/theater_filter_notifer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TheaterFilterPicker extends ConsumerStatefulWidget implements FilterPicker {
  final AbstractFilter filter;
  final double? elevation;
  const TheaterFilterPicker({super.key, required this.filter, this.elevation});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FilterPickerState();
}

class _FilterPickerState extends ConsumerState<TheaterFilterPicker> {
  Set<String> currentFilters = <String>{};

  @override
  void initState() {
    currentFilters = ref.read(theaterFiltersProvider.notifier).getCurrentSet(widget.filter);
    super.initState();
  }

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
                        currentFilters = ref
                            .read(theaterFiltersProvider.notifier)
                            .addFilter(widget.filter, filterString);
                      } else {
                        currentFilters = ref
                            .read(theaterFiltersProvider.notifier)
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
