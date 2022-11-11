import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);
  final List<LabeledCardItem> items;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const SpacerBox.verticalS(),
      itemBuilder: (context, index) {
        return LabeledCard(
          onTap: () => onTap(index),
          item: items[index],
        );
      },
    );
  }
}
