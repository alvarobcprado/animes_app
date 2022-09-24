import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class LabeledIconButton extends StatelessWidget {
  const LabeledIconButton({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.isReducedSize = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final bool isReducedSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Theme.of(context).primaryColor;
    final buttonTextStyle = Theme.of(context).textTheme.button?.copyWith(
          color: buttonColor,
        );

    return SizedBox(
      width: isReducedSize ? null : double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: buttonColor,
            width: AppSizesFoundation.buttonBorderStroke,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizesFoundation.buttonBorderRadius,
            ),
          ),
          foregroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: buttonTextStyle,
            ),
            const SizedBox(width: AppSizesFoundation.baseSpace),
            Icon(
              icon,
              color: buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
