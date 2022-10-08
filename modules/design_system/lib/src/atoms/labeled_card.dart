import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class LabeledCard extends StatelessWidget {
  const LabeledCard({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
    required this.fourthTitle,
    required this.firstSubtitle,
    required this.secondSubtitle,
    required this.thirdSubtitle,
    required this.fourthSubtitle,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String fourthTitle;
  final String firstSubtitle;
  final String secondSubtitle;
  final String thirdSubtitle;
  final String fourthSubtitle;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        color: colors.surface,
        shape: RoundedRectangleBorder(
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
                  imageUrl: imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              width: AppSizesFoundation.baseSpace * 2,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegularRow(title: firstTitle, subtitle: firstSubtitle),
                  RegularRow(title: secondTitle, subtitle: secondSubtitle),
                  RegularRow(title: thirdTitle, subtitle: thirdSubtitle),
                  RegularRow(title: fourthTitle, subtitle: fourthSubtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
