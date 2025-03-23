import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChoicePicker extends ConsumerStatefulWidget {
  final List<String> choices;
  final ValueChanged<String?> onChange;
  const ChoicePicker({super.key, required this.choices, required this.onChange});

  @override
  ConsumerState<ChoicePicker> createState() => _ChoicePickerState();
}

class _ChoicePickerState extends ConsumerState<ChoicePicker> {
  String? selectedValue;

  void setSelectedValue(String? value) {
    widget.onChange(value);
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Choice<String>.inline(
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
    );
  }
}
