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

    return Card(
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
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _LabeledCardImage(item: item),
            const SpacerBox.horizontalXS(),
            _LabeledCardInfo(item: item),
            const SpacerBox.horizontalXS(),
          ],
        ),
      ),
    );
  }
}

class _LabeledCardImage extends StatelessWidget {
  const _LabeledCardImage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LabeledCardItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
            ? 3 / 4
            : 1,
        child: AppNetworkImage(
          imageUrl: item.imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _LabeledCardInfo extends StatelessWidget {
  const _LabeledCardInfo({
    Key? key,
    required this.item,
  }) : super(key: key);

  final LabeledCardItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: item.labels
              .map(
                (label) => RegularRow(
                  title: label.title,
                  subtitle: label.subtitle,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
