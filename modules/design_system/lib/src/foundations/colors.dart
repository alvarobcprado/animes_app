import 'package:design_system/src/tokens/colors.dart';
import 'package:flutter/material.dart';

class AppColorsFoundation extends ThemeExtension<AppColorsFoundation> {
  const AppColorsFoundation({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quaternary,
    required this.quinary,
    required this.background,
    required this.onBackground,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
  });

  static const dark = AppColorsFoundation(
    primary: AppColors.babyBlueEyes,
    secondary: AppColors.mauve,
    tertiary: AppColors.cherryBlossomPink,
    quaternary: AppColors.macaroniAndCheese,
    quinary: AppColors.lightPink,
    background: AppColors.darkBackground,
    onBackground: AppColors.onDarkBackground,
    error: AppColors.darkError,
    onError: AppColors.onDarkError,
    surface: AppColors.darkSurface,
    onSurface: AppColors.onDarkSurface,
  );

  static const light = AppColorsFoundation(
    primary: AppColors.yInMnBlue,
    secondary: AppColors.mauve,
    tertiary: AppColors.cherryBlossomPink,
    quaternary: AppColors.macaroniAndCheese,
    quinary: AppColors.lightPink,
    background: AppColors.lightBackground,
    onBackground: AppColors.onLightBackground,
    error: AppColors.lightError,
    onError: AppColors.onLightError,
    surface: AppColors.lightSurface,
    onSurface: AppColors.onLightSurface,
  );

  final Color? primary;
  final Color? secondary;
  final Color? tertiary;
  final Color? quaternary;
  final Color? quinary;

  final Color? background;
  final Color? onBackground;

  final Color? error;
  final Color? onError;

  final Color? surface;
  final Color? onSurface;

  @override
  AppColorsFoundation copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? quaternary,
    Color? quinary,
    Color? background,
    Color? onBackground,
    Color? error,
    Color? onError,
    Color? surface,
    Color? onSurface,
  }) {
    return AppColorsFoundation(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      quaternary: quaternary ?? this.quaternary,
      quinary: quinary ?? this.quinary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  AppColorsFoundation lerp(
    ThemeExtension<AppColorsFoundation>? other,
    double t,
  ) {
    if (other is! AppColorsFoundation) {
      return this;
    }
    return AppColorsFoundation(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      tertiary: Color.lerp(tertiary, other.tertiary, t),
      quaternary: Color.lerp(quaternary, other.quaternary, t),
      quinary: Color.lerp(quinary, other.quinary, t),
      background: Color.lerp(background, other.background, t),
      onBackground: Color.lerp(onBackground, other.onBackground, t),
      error: Color.lerp(error, other.error, t),
      onError: Color.lerp(onError, other.onError, t),
      surface: Color.lerp(surface, other.surface, t),
      onSurface: Color.lerp(onSurface, other.onSurface, t),
    );
  }
}
