import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:flutter/material.dart';

class NextAnimePageErrorIndicator extends StatelessWidget {
  const NextAnimePageErrorIndicator({
    Key? key,
    required this.hasPaginationError,
    required this.onTryAgainTap,
  }) : super(key: key);

  final bool hasPaginationError;
  final VoidCallback onTryAgainTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: child,
        );
      },
      child: hasPaginationError
          ? PaddingBox.ltrbFactor(
              leftFactor: 6,
              rightFactor: 6,
              bottomFactor: 1,
              topFactor: 1,
              child: Center(
                child: Failure(
                  message: HomeStrings.of(context)!.animeListNextPageError,
                  centerMessage: true,
                  buttonText: CoreStrings.of(context)!.tryAgain,
                  onButtonPressed: onTryAgainTap,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
