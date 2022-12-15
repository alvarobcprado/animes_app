import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/presentation/anime_details/widgets/anime_info_row.dart';
import 'package:flutter/material.dart';

import 'anime_details_controller.dart';

class AnimeDetailsPage extends StatefulWidget {
  const AnimeDetailsPage({
    super.key,
    required this.controller,
    required this.animeId,
  });

  final AnimeDetailsController controller;
  final int animeId;

  static Widget create(int animeId) =>
      ProxyProvider<AnimeDetailsStore, AnimeDetailsController>(
        update: (_, animeDetailsStore, controller) =>
            controller ??
            AnimeDetailsController(
              animeDetailsStore,
            ),
        child: Consumer<AnimeDetailsController>(
          builder: (_, controller, __) => AnimeDetailsPage(
            controller: controller,
            animeId: animeId,
          ),
        ),
      );

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {
  AnimeDetailsController get _pageController => widget.controller;

  @override
  void initState() {
    super.initState();
    _pageController.getAnimeDetails(widget.animeId);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>();
    final homeStrings = HomeStrings.of(context)!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(color: colors?.primary),
            backgroundColor: colors?.background.withOpacity(0),
            pinned: true,
            scrolledUnderElevation: 0,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: PaddingBox.horizontalS(
              child: ScopedBuilder<AnimeDetailsStore, Exception,
                  AnimeDetailsModel>(
                store: widget.controller.animeDetailsStore,
                onLoading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (_, error) {
                  final message = error!.getErrorMessage(context);
                  return Failure(
                      message: message,
                      buttonText: CoreStrings.of(context)!.tryAgain,
                      onButtonPressed: () => _pageController.animeDetailsStore
                          .getAnimeDetails(widget.animeId));
                },
                onState: (context, state) {
                  final animeDetail = state.animeDetails;
                  if (animeDetail == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      const SpacerBox.verticalS(),
                      ImageCardButton(
                        buttonIcon: animeDetail.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        buttonLabel:
                            HomeStrings.of(context)!.animeDetailsPageFavorite,
                        imageUrl: animeDetail.image,
                        onButtonPressed: () {
                          _pageController.toggleFavoriteAnime(animeDetail);
                        },
                      ),
                      const SpacerBox.verticalS(),
                      AnimeInfoRow(
                        title: homeStrings.animeOriginalTitle,
                        info: animeDetail.title,
                      ),
                      AnimeInfoRow(
                        title: homeStrings.animeEnglishTitle,
                        info: animeDetail.titleEnglish,
                      ),
                      AnimeInfoRow(
                        title: homeStrings.animeReleaseDate,
                        info: animeDetail.release.convertDateToCurrentLocale(
                          context,
                        ),
                      ),
                      AnimeInfoRow(
                        title: homeStrings.animeEndDate,
                        info: animeDetail.end.convertDateToCurrentLocale(
                          context,
                        ),
                      ),
                      AnimeInfoRow(
                        title: homeStrings.animeNote,
                        info: animeDetail.score.toString(),
                      ),
                      AnimeInfoRow(
                        title: homeStrings.animeSynopsis,
                        info: animeDetail.synopsis,
                      ),
                      const SpacerBox.verticalS(),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
