import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  const TextFieldPrimary({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.keyboardType,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    final textStyles = theme.extension<AppTypographyFoundation>()!;

    return TextField(
      style: textStyles.h6,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintStyle: textStyles.h6,
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}
