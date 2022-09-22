import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:design_system/src/tokens/colors.dart';
import 'package:flutter/material.dart';

final darkAppThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.babyBlueEyes,
  backgroundColor: AppColors.darkBackground,
  errorColor: AppColors.darkError,
  useMaterial3: true,
  extensions: const [
    AppColorsFoundation.dark,
    AppTypographyFoundation.dark,
  ],
);
