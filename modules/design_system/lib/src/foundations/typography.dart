import 'package:flutter/material.dart';

import '../tokens/typography.dart';

class AppTypographyFoundation extends ThemeExtension<AppTypographyFoundation> {
  const AppTypographyFoundation({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
  });

  static const dark = AppTypographyFoundation(
    h1: AppTypography.h1Dark,
    h2: AppTypography.h2Dark,
    h3: AppTypography.h3Dark,
    h4: AppTypography.h4Dark,
  );

  static const light = AppTypographyFoundation(
    h1: AppTypography.h1Light,
    h2: AppTypography.h2Light,
    h3: AppTypography.h3Light,
    h4: AppTypography.h4Light,
  );

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;

  @override
  AppTypographyFoundation copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
  }) {
    return AppTypographyFoundation(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h3,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
    );
  }

  @override
  AppTypographyFoundation lerp(
    ThemeExtension<AppTypographyFoundation>? other,
    double t,
  ) {
    if (other is! AppTypographyFoundation) {
      return this;
    }
    return AppTypographyFoundation(
      h1: TextStyle.lerp(h1, other.h1, t) ?? h1,
      h2: TextStyle.lerp(h2, other.h2, t) ?? h2,
      h3: TextStyle.lerp(h3, other.h3, t) ?? h3,
      h4: TextStyle.lerp(h4, other.h4, t) ?? h4,
    );
  }
}
