import 'dart:ui';

import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class ImageCardButton extends StatelessWidget {
  const ImageCardButton({
    super.key,
    this.cardBackgroundColor,
    this.cardLoadingColor,
    this.buttonColor,
    this.buttonBackgroundColor,
    required this.buttonIcon,
    required this.buttonLabel,
    required this.imageUrl,
    required this.onButtonPressed,
  });

  final Color? cardBackgroundColor;
  final Color? cardLoadingColor;
  final Color? buttonColor;
  final Color? buttonBackgroundColor;
  final IconData buttonIcon;
  final String buttonLabel;
  final String imageUrl;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    return AspectRatio(
      aspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
          ? 16 / 9
          : 16 / 6.5,
      child: Card(
        elevation: 0,
        color: cardBackgroundColor ?? colors.primary,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizesFoundation.baseSpace * 2),
          side: BorderSide.none,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              loadingColor: cardLoadingColor ?? colors.onPrimary,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: AppNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fitHeight,
                loadingColor: cardLoadingColor ?? colors.onPrimary,
              ),
            ),
            Positioned(
              bottom: AppSizesFoundation.baseSpace,
              right: AppSizesFoundation.baseSpace,
              child: LabeledIconButton(
                label: buttonLabel,
                icon: buttonIcon,
                color: buttonColor ?? colors.quaternary,
                backgroundColor: buttonBackgroundColor ?? colors.surface,
                isReducedSize: true,
                onPressed: onButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
