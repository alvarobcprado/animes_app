import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class SpacerBox extends StatelessWidget {
  const SpacerBox._({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  factory SpacerBox.customFactor({
    double horizontalFactor = 0,
    double verticalFactor = 0,
  }) =>
      SpacerBox._(
        height: AppSizesFoundation.baseSpace * verticalFactor,
        width: AppSizesFoundation.baseSpace * horizontalFactor,
      );

  factory SpacerBox.verticalFactor({double sizeFactor = 0}) => SpacerBox._(
        height: sizeFactor * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalFactor({double sizeFactor = 0}) => SpacerBox._(
        width: sizeFactor * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalXS() => const SpacerBox._(
        width: 1 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalS() => const SpacerBox._(
        width: 2 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalM() => const SpacerBox._(
        width: 4 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalL() => const SpacerBox._(
        width: 8 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.horizontalXL() => const SpacerBox._(
        width: 16 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.verticalXS() => const SpacerBox._(
        height: 1 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.verticalS() => const SpacerBox._(
        height: 2 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.verticalM() => const SpacerBox._(
        height: 4 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.verticalL() => const SpacerBox._(
        height: 8 * AppSizesFoundation.baseSpace,
      );

  factory SpacerBox.verticalXL() => const SpacerBox._(
        height: 16 * AppSizesFoundation.baseSpace,
      );

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
