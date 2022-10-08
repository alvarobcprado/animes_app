import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class FilterSelectChipList extends StatelessWidget {
  const FilterSelectChipList({
    super.key,
    required this.items,
    required this.onSelected,
  });

  final List<String> items;
  final Function(bool, int) onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var index = 0; index < items.length; index++) ...[
            LabeledChip(
              label: items[index],
              onTap: (isActive) => onSelected(isActive, index),
            ),
            if (index >= 0 && index < items.length - 1)
              const SizedBox(width: AppSizesFoundation.baseSpace),
          ],
        ],
      ),
    );
  }
}
