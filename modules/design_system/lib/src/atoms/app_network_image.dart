import 'package:cached_network_image/cached_network_image.dart';
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
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      progressIndicatorBuilder: (_, __, progress) {
        return loadingPlaceholder ??
            Center(
              child: CircularProgressIndicator(
                color: loadingColor ?? colors.primary,
                value: progress.progress,
              ),
            );
      },
      errorWidget: (context, url, error) =>
          errorPlaceholder ??
          Center(
            child: errorPlaceholder ??
                Icon(
                  Icons.error,
                  color: colors.error,
                ),
          ),
    );
  }
}
