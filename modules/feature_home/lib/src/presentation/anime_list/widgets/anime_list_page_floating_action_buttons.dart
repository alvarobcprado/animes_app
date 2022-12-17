import 'package:design_system/design_system.dart';
import 'package:feature_home/src/routes/home_routes.dart';
import 'package:flutter/material.dart';

class AnimeListPageFloatingActionButtons extends StatelessWidget {
  const AnimeListPageFloatingActionButtons({
    Key? key,
    required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return Positioned(
      bottom: 16,
      right: 0,
      child: Column(
        children: [
          IconButton(
            color: colors.onPrimary,
            style: IconButton.styleFrom(
              backgroundColor: colors.primary,
              padding: const EdgeInsets.all(12),
            ),
            onPressed: () {
              _scrollController.jumpTo(
                0,
              );
            },
            icon: const Icon(Icons.arrow_upward),
          ),
          const SpacerBox.verticalXS(),
          IconButton(
            color: colors.onPrimary,
            style: IconButton.styleFrom(
              backgroundColor: colors.primary,
              padding: const EdgeInsets.all(12),
            ),
            onPressed: () => context.goToFavorites(),
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
