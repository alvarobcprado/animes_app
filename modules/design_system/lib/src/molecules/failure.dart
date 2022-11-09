import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  const Failure({
    Key? key,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    final textStyles = theme.extension<AppTypographyFoundation>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: textStyles.h1,
        ),
        const SpacerBox.verticalXS(),
        ElevatedButton(
          onPressed: onButtonPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.error,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            buttonText,
            style: textStyles.h4,
          ),
        ),
      ],
    );
  }
}
