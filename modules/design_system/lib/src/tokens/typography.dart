import 'package:design_system/src/tokens/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTypography {
  static const TextStyle h1Light = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h1Dark = TextStyle(
    fontSize: 12,
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
    fontSize: 12,
    fontStyle: FontStyle.normal,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h3Dark = TextStyle(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    color: AppColors.onDarkSurface,
  );

  static const TextStyle h4Light = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColors.onLightError,
  );
  static const TextStyle h4Dark = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    color: AppColors.onDarkError,
  );

  static const TextStyle h5Light = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h5Dark = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
    color: AppColors.onDarkSurface,
  );

  static const TextStyle h6Light = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColors.onLightSurface,
  );
  static const TextStyle h6Dark = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    color: AppColors.onDarkSurface,
  );
}
