import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    Key? key,
    required this.isLoading,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  final bool isLoading;
  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    final textStyles = theme.extension<AppTypographyFoundation>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizesFoundation.baseSpace,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize:
              const Size(double.infinity, AppSizesFoundation.baseSpace * 7.5),
          backgroundColor: colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppSizesFoundation.buttonBorderRadius),
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: colors.surface,
              )
            : Text(
                buttonText,
                style: textStyles.h2,
              ),
      ),
    );
  }
}
