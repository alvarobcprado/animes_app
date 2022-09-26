import 'package:design_system/src/foundations/sizes.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:flutter/material.dart';

class RegularRow extends StatelessWidget {
  const RegularRow({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<AppTypographyFoundation>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppSizesFoundation.regularRowVerticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyles.h1,
          ),
          const SizedBox(width: AppSizesFoundation.baseSpace * 0.5),
          Expanded(
            child: Text(
              subtitle,
              style: textStyles.h3,
            ),
          )
        ],
      ),
    );
  }
}
