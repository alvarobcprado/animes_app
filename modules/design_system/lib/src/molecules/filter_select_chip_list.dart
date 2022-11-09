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
    return LimitedBox(
      maxHeight: AppSizesFoundation.baseSpace * 6,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        separatorBuilder: (context, index) => const SpacerBox.horizontalXS(),
        itemBuilder: (context, index) {
          return LabeledChip(
            label: items[index],
            onTap: (value) => onSelected(value, index),
          );
        },
      ),
    );
  }
}
