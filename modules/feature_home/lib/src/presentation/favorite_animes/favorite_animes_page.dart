import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/routing.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:core/dependencies/utils.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/presentation/favorite_animes/stores/stores.dart';
import 'package:feature_home/src/routes/home_routes.dart';
import 'package:flutter/material.dart';

import 'favorite_animes_controller.dart';

class FavoriteAnimesPage extends StatefulWidget {
  const FavoriteAnimesPage({
    super.key,
    required this.controller,
  });

  final FavoriteAnimesController controller;

  static Widget create() =>
      ProxyProvider<FavoriteAnimesStore, FavoriteAnimesController>(
        update: (_, favoriteAnimesStore, controller) =>
            controller ??
            FavoriteAnimesController(
              favoriteAnimesStore,
            ),
        child: Consumer<FavoriteAnimesController>(
          builder: (_, controller, __) =>
              FavoriteAnimesPage(controller: controller),
        ),
      );

  @override
  State<FavoriteAnimesPage> createState() => _FavoriteAnimesPageState();
}

class _FavoriteAnimesPageState extends State<FavoriteAnimesPage> {
  FavoriteAnimesController get _pageController => widget.controller;
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _pageController.getFavoriteAnimes();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return FocusDetector(
      key: _focusDetectorKey,
      onFocusGained: () {
        _pageController.getFavoriteAnimes();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(HomeStrings.of(context)!.favoriteAnimesPageTitleAppBar),
        ),
        body: PaddingBox.ltrbFactor(
          leftFactor: 2,
          rightFactor: 2,
          child: ScopedBuilder<FavoriteAnimesStore, Exception,
                  FavoriteAnimesModel>(
              store: _pageController.favoriteAnimesStore,
              onLoading: (_) => Center(
                    child: CircularProgressIndicator(
                      color: colors.primary,
                    ),
                  ),
              onError: (_, error) {
                final message = error!.getErrorMessage(context);
                return Center(
                  child: Failure(
                      message: message,
                      buttonText: CoreStrings.of(context)!.tryAgain,
                      onButtonPressed: () =>
                          _pageController.getFavoriteAnimes()),
                );
              },
              onState: (_, state) {
                final favorites = state.animes;
                return favorites.isNotEmpty
                    ? CardList(
                        items: favorites
                            .map(
                              (e) => LabeledCardItem(
                                imageUrl: e.image,
                                labels: [
                                  LabeledCardText(
                                    title: HomeStrings.of(context)!
                                        .animeListPageLabeledCardTitle,
                                    subtitle: e.title,
                                  ),
                                  LabeledCardText(
                                    title: HomeStrings.of(context)!
                                        .animeReleaseDate,
                                    subtitle: e.release.isNotEmpty
                                        ? e.release
                                            .convertDateToCurrentLocale(context)
                                        : HomeStrings.of(context)!
                                            .animeInformationSoon,
                                  ),
                                  LabeledCardText(
                                    title:
                                        HomeStrings.of(context)!.animeEndDate,
                                    subtitle: e.end.isNotEmpty
                                        ? e.end
                                            .convertDateToCurrentLocale(context)
                                        : HomeStrings.of(context)!
                                            .animeInformationSoon,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                        onTap: (index) => GoRouter.of(context).pushDetails(
                          state.animes[index].id,
                        ),
                      )
                    : const Center(
                        child: Text('No favorites'),
                      );
              }),
        ),
      ),
    );
  }
}
