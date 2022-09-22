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
    required this.onPrimary,
    required this.onSecondary,
    required this.onTertiary,
    required this.onQuaternary,
    required this.onQuinary,
  });

  static const dark = AppColorsFoundation(
    primary: AppColors.babyBlueEyes,
    secondary: AppColors.mauve,
    tertiary: AppColors.cherryBlossomPink,
    quaternary: AppColors.lightPink,
    quinary: AppColors.macaroniAndCheese,
    background: AppColors.darkBackground,
    onBackground: AppColors.onDarkBackground,
    error: AppColors.darkError,
    onError: AppColors.onDarkError,
    surface: AppColors.darkSurface,
    onSurface: AppColors.onDarkSurface,
    onPrimary: AppColors.onBabyBlueEyes,
    onSecondary: AppColors.onMauve,
    onTertiary: AppColors.onCherryBlossomPink,
    onQuaternary: AppColors.onLightPink,
    onQuinary: AppColors.onMacaroniAndCheese,
  );

  static const light = AppColorsFoundation(
    primary: AppColors.yInMnBlue,
    secondary: AppColors.chineseViolet,
    tertiary: AppColors.cinnamonSatin,
    quaternary: AppColors.candyPink,
    quinary: AppColors.tumbleweed,
    background: AppColors.lightBackground,
    onBackground: AppColors.onLightBackground,
    error: AppColors.lightError,
    onError: AppColors.onLightError,
    surface: AppColors.lightSurface,
    onSurface: AppColors.onLightSurface,
    onPrimary: AppColors.onYInMnBlue,
    onSecondary: AppColors.onChineseViolet,
    onTertiary: AppColors.onCinnamonSatin,
    onQuaternary: AppColors.onCandyPink,
    onQuinary: AppColors.onTumbleweed,
  );

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quaternary;
  final Color quinary;

  final Color onPrimary;
  final Color onSecondary;
  final Color onTertiary;
  final Color onQuaternary;
  final Color onQuinary;

  final Color background;
  final Color onBackground;

  final Color error;
  final Color onError;

  final Color surface;
  final Color onSurface;

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
    Color? onPrimary,
    Color? onSecondary,
    Color? onTertiary,
    Color? onQuaternary,
    Color? onQuinary,
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
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onTertiary: onTertiary ?? this.onTertiary,
      onQuaternary: onQuaternary ?? this.onQuaternary,
      onQuinary: onQuinary ?? this.onQuinary,
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
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
      quaternary: Color.lerp(quaternary, other.quaternary, t) ?? quaternary,
      quinary: Color.lerp(quinary, other.quinary, t) ?? quinary,
      background: Color.lerp(background, other.background, t) ?? background,
      onBackground:
          Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t) ?? onTertiary,
      onQuaternary:
          Color.lerp(onQuaternary, other.onQuaternary, t) ?? onQuaternary,
      onQuinary: Color.lerp(onQuinary, other.onQuinary, t) ?? onQuinary,
    );
  }
}
