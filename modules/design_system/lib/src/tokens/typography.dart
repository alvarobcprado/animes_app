import 'package:design_system/src/tokens/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTypography {
  static const TextStyle h1Light = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h1Dark = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.onDarkSurface,
  );

  static const TextStyle h2Light = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColors.lightSurface,
  );
  static const TextStyle h2Dark = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColors.darkSurface,
  );

  static const TextStyle h3Light = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h3Dark = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColors.onDarkSurface,
  );
}
