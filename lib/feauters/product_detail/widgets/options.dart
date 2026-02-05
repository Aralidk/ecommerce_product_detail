import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../product_detail_controller.dart';

class VariantOptions extends ConsumerWidget {
  const VariantOptions({
    required this.productHandle,
    required this.options,
    required this.selectedOptions,
  });

  final String productHandle;
  final List options;
  final Map<String, String> selectedOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: options.map<Widget>((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Wrap(
            spacing: 8,
            children: option.values.map<Widget>((value) {
              final isSelected = selectedOptions[option.name] == value;

              return ChoiceChip(
                label: Text(value),
                selected: isSelected,
                showCheckmark: true,
                checkmarkColor: Colors.white,
                selectedColor: Colors.black,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                backgroundColor: Colors.grey.shade200,
                onSelected: (_) {
                  ref
                      .read(productDetailProvider(productHandle).notifier)
                      .selectOption(option.name, value);
                },
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}