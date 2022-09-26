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
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: LabeledChip(
            label: items[index],
            onTap: (isActive) => onSelected(isActive, index),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: AppSizesFoundation.baseSpace);
      },
    );
  }
}
