import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/sizes.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizesFoundation.baseSpace,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
