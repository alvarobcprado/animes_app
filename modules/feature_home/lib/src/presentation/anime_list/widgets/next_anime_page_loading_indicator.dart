import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NextAnimePageLoadingIndicator extends StatelessWidget {
  const NextAnimePageLoadingIndicator({
    Key? key,
    required this.isLoadingNewPage,
  }) : super(key: key);

  final bool isLoadingNewPage;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      bottom: isLoadingNewPage ? 48 : 0,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isLoadingNewPage ? 1 : 0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: colors.onSurface.withOpacity(
                  0.5,
                ),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: PaddingBox.allFactor(
            factor: 0.5,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: CircularProgressIndicator(
                color: colors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
