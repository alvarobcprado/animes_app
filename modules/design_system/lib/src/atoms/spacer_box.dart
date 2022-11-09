import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';

class SpacerBox extends StatelessWidget {
  const SpacerBox._({
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  const SpacerBox.customFactor({
    Key? key,
    double horizontalFactor = 0,
    double verticalFactor = 0,
  }) : this._(
          key: key,
          height: AppSizesFoundation.baseSpace * verticalFactor,
          width: AppSizesFoundation.baseSpace * horizontalFactor,
        );

  const SpacerBox.verticalFactor({double sizeFactor = 0, Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: sizeFactor,
        );

  const SpacerBox.horizontalFactor({double sizeFactor = 0, Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: sizeFactor,
        );

  const SpacerBox.horizontalXS({Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: 1,
        );

  const SpacerBox.horizontalS({Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: 2,
        );

  const SpacerBox.horizontalM({Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: 4,
        );

  const SpacerBox.horizontalL({Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: 8,
        );

  const SpacerBox.horizontalXL({Key? key})
      : this.customFactor(
          key: key,
          horizontalFactor: 16,
        );

  const SpacerBox.verticalXS({Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: 1,
        );

  const SpacerBox.verticalS({Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: 2,
        );

  const SpacerBox.verticalM({Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: 4,
        );

  const SpacerBox.verticalL({Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: 8,
        );

  const SpacerBox.verticalXL({Key? key})
      : this.customFactor(
          key: key,
          verticalFactor: 16,
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
