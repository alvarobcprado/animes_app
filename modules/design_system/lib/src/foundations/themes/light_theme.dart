import 'package:design_system/src/foundations/colors.dart';
import 'package:flutter/material.dart';

final lightAppThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorsFoundation.lightPrimary,
  backgroundColor: AppColorsFoundation.lightBackground,
  errorColor: AppColorsFoundation.lightError,
  useMaterial3: true,
);
