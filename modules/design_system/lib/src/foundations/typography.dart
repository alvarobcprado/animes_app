import 'package:flutter/material.dart';

import '../tokens/typography.dart';

class AppTypographyFoundation extends ThemeExtension<AppTypographyFoundation> {
  const AppTypographyFoundation({
    required this.h1,
    required this.h2,
    required this.h3,
  });

  static const dark = AppTypographyFoundation(
    h1: AppTypography.h1Light,
    h2: AppTypography.h2Light,
    h3: AppTypography.h3Light,
  );

  static const light = AppTypographyFoundation(
    h1: AppTypography.h1Dark,
    h2: AppTypography.h2Dark,
    h3: AppTypography.h3Dark,
  );

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;

  @override
  AppTypographyFoundation copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
  }) {
    return AppTypographyFoundation(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h3,
      h3: h3 ?? this.h3,
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
    );
  }
}
