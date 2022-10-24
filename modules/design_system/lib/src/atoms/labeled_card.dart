import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/colors.dart';
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

    return GestureDetector(
      onTap: onTap,
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
            Expanded(
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: AppNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SpacerBox.horizontalXS(),
            Expanded(
              flex: 2,
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
    );
  }
}
