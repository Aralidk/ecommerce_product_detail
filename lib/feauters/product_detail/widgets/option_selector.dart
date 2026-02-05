import 'package:flutter/material.dart';
import '../model/product_model.dart';

class OptionSelector extends StatelessWidget {
  const OptionSelector({
    super.key,
    required this.option,
    required this.selectedValue,
    required this.onSelected,
  });

  final ProductOption option;
  final String selectedValue;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(option.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: option.values.map((value) {
            return ChoiceChip(
              label: Text(value),
              selected: value == selectedValue,
              onSelected: (_) => onSelected(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
