import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/view/widgets/Theater/choice_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NestedChoicePicker extends ConsumerStatefulWidget {
  final List<String> choices;
  final ValueChanged<String?> onChange;
  final ChoicePicker choicePicker;
  const NestedChoicePicker({super.key, required this.choices, required this.onChange, required this.choicePicker});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NestedChoicePickerState();
}

class _NestedChoicePickerState extends ConsumerState<NestedChoicePicker> {
  String? selectedValue;

  void setSelectedValue(String? value) {
    widget.onChange(value);
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Choice<String>.inline(
          clearable: true,
          value: ChoiceSingle.value(selectedValue),
          onChanged: ChoiceSingle.onChanged((v) => setSelectedValue(v)),
          itemCount: widget.choices.length,
          itemBuilder: (state, i) {
            return ChoiceChip(
              selected: state.selected(widget.choices[i]),
              onSelected: state.onSelected(widget.choices[i]),
              label: Text(widget.choices[i]),
              labelPadding: EdgeInsets.symmetric(horizontal: 2),
              visualDensity: VisualDensity.compact,
            );
          },
          listBuilder: ChoiceList.createScrollable(
            spacing: 5,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
        ),
        widget.choicePicker,
      ],
    );
  }
}
