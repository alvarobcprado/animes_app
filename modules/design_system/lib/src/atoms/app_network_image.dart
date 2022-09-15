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
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? loadingPlaceholder;
  final Widget? errorPlaceholder;

  double? loadingProgressOrNull(ImageChunkEvent event) {
    if (event.expectedTotalBytes != null) {
      return event.cumulativeBytesLoaded / event.expectedTotalBytes!;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        final progress = loadingProgressOrNull(loadingProgress);

        return loadingPlaceholder ??
            Center(
              child: CircularProgressIndicator(
                value: progress,
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
