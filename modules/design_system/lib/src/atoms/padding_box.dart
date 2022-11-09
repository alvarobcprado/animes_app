import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class PaddingBox extends StatelessWidget {
  const PaddingBox({
    required this.padding,
    required this.child,
    Key? key,
  }) : super(key: key);

  PaddingBox.ltrbFactor({
    double leftFactor = 0,
    double rightFactor = 0,
    double topFactor = 0,
    double bottomFactor = 0,
    required Widget child,
    Key? key,
  }) : this(
          child: child,
          key: key,
          padding: EdgeInsets.fromLTRB(
            AppSizesFoundation.baseSpace * leftFactor,
            AppSizesFoundation.baseSpace * topFactor,
            AppSizesFoundation.baseSpace * rightFactor,
            AppSizesFoundation.baseSpace * bottomFactor,
          ),
        );

  PaddingBox.allFactor({
    required Widget child,
    required double factor,
    Key? key,
  }) : this(
          child: child,
          key: key,
          padding: EdgeInsets.all(AppSizesFoundation.baseSpace * factor),
        );

  PaddingBox.verticalFactor({
    double factor = 0,
    required Widget child,
    Key? key,
  }) : this(
          child: child,
          key: key,
          padding: EdgeInsets.symmetric(
            vertical: AppSizesFoundation.baseSpace * factor,
          ),
        );

  PaddingBox.horizontalFactor({
    double factor = 0,
    required Widget child,
    Key? key,
  }) : this(
          child: child,
          key: key,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizesFoundation.baseSpace * factor,
          ),
        );

  const PaddingBox.verticalXS({
    required Widget child,
    Key? key,
  }) : this(
          child: child,
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 1),
        );

  const PaddingBox.verticalS({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            vertical: 2 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.verticalM({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            vertical: 4 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.verticalL({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            vertical: 8 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.verticalXL({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            vertical: 16 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.horizontalXS({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            horizontal: 1 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.horizontalS({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            horizontal: 2 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.horizontalM({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            horizontal: 4 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.horizontalL({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            horizontal: 8 * AppSizesFoundation.baseSpace,
          ),
          key: key,
          child: child,
        );

  const PaddingBox.horizontalXL({
    required Widget child,
    Key? key,
  }) : this(
          padding: const EdgeInsets.symmetric(
            horizontal: 16 * AppSizesFoundation.baseSpace,
          ),
          key: key,
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
