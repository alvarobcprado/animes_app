import 'package:design_system/src/foundations/colors.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.errorPlaceholder,
    this.loadingPlaceholder,
    this.loadingColor,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? loadingPlaceholder;
  final Widget? errorPlaceholder;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return AnimatedSwitcher(
          duration: const Duration(
            milliseconds: 250,
          ),
          child: frame != null
              ? SizedBox.expand(child: child)
              : Center(
                  child: loadingPlaceholder ??
                      CircularProgressIndicator(
                        color: loadingColor ?? colors.primary,
                      ),
                ),
        );
      },
      errorBuilder: (_, __, ___) => SizedBox(
        width: width,
        height: height,
        child: Center(
          child: errorPlaceholder ?? const Placeholder(),
        ),
      ),
    );
  }
}
