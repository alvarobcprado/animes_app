import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class PaddingBox extends StatelessWidget {
  const PaddingBox({
    required this.padding,
    required this.child,
    Key? key,
  }) : super(key: key);

  factory PaddingBox.ltrbFactor({
    double leftFactor = 0,
    double rightFactor = 0,
    double topFactor = 0,
    double bottomFactor = 0,
    required Widget child,
  }) =>
      PaddingBox(
        padding: EdgeInsets.fromLTRB(
          leftFactor * AppSizesFoundation.baseSpace,
          topFactor * AppSizesFoundation.baseSpace,
          rightFactor * AppSizesFoundation.baseSpace,
          bottomFactor * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.allFactor({
    required Widget child,
    double factor = 0,
  }) =>
      PaddingBox(
        padding: EdgeInsets.all(factor * AppSizesFoundation.baseSpace),
        child: child,
      );

  factory PaddingBox.verticalFactor({
    double factor = 0,
    required Widget child,
  }) =>
      PaddingBox(
        padding: EdgeInsets.symmetric(
          vertical: factor * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalFactor({
    double factor = 0,
    required Widget child,
  }) =>
      PaddingBox(
        padding: EdgeInsets.symmetric(
          horizontal: factor * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.verticalXS({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          vertical: 1 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.verticalS({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          vertical: 2 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.verticalM({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          vertical: 4 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.verticalL({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          vertical: 8 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.verticalXL({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          vertical: 16 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalXS({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          horizontal: 1 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalS({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          horizontal: 2 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalM({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          horizontal: 4 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalL({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          horizontal: 8 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  factory PaddingBox.horizontalXL({
    required Widget child,
  }) =>
      PaddingBox(
        padding: const EdgeInsets.symmetric(
          horizontal: 16 * AppSizesFoundation.baseSpace,
        ),
        child: child,
      );

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: child,
    );
  }
}
