import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
    required this.items,
    required this.onTap,
    required this.scrollController,
  }) : super(key: key);
  final List<LabeledCardItem> items;
  final Function(int) onTap;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: items.length,
      separatorBuilder: (context, index) => SpacerBox.verticalS(),
      itemBuilder: (context, index) {
        return LabeledCard(
          onTap: () => onTap(index),
          item: items[index],
        );
      },
    );
  }
}
