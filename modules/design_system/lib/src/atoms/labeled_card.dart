import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class LabeledCard extends StatelessWidget {
  const LabeledCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);
  final LabeledCardItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    final orientation = MediaQuery.of(context).orientation;

    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: orientation == Orientation.portrait ? 16 / 8 : 16 / 5,
        child: Card(
          margin: EdgeInsets.zero,
          color: colors.surface,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizesFoundation.baseSpace,
            ),
            side: BorderSide(
              color: colors.primary,
              width: 2,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: orientation == Orientation.portrait ? 3 : 2,
                child: AppNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SpacerBox.horizontalXS(),
              Flexible(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...item.labels.map(
                        (label) => RegularRow(
                          title: label.title,
                          subtitle: label.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SpacerBox.horizontalXS(),
            ],
          ),
        ),
      ),
    );
  }
}
