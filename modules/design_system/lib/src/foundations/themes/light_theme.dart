import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/tokens/colors.dart';
import 'package:flutter/material.dart';

final lightAppThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.yInMnBlue,
  backgroundColor: AppColors.lightBackground,
  errorColor: AppColors.lightError,
  useMaterial3: true,
  extensions: const [
    AppColorsFoundation.light,
  ],
);
