import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/presentation/anime_details/anime_details_notifier.dart';
import 'package:feature_home/src/presentation/anime_details/models/anime_details_models.dart';
import 'package:feature_home/src/presentation/anime_details/widgets/anime_info_row.dart';
import 'package:flutter/material.dart';

class AnimeDetailsPage extends StatelessWidget {
  const AnimeDetailsPage({
    super.key,
    required this.notifier,
    required this.animeId,
  });

  final AnimeDetailsNotifier notifier;
  final int animeId;

  static Widget create(int animeId) => ProxyProvider2<GetAnimeDetailsUseCase,
          ToggleFavoriteAnimeUseCase, AnimeDetailsNotifier>(
        update:
            (_, getAnimeDetailsUseCase, toggleFavoriteAnimeUseCase, notifier) =>
                notifier ??
                AnimeDetailsNotifier(
                  getAnimeDetailsUseCase: getAnimeDetailsUseCase,
                  toggleFavoriteAnimeUseCase: toggleFavoriteAnimeUseCase,
                  animeId: animeId,
                ),
        dispose: (_, notifier) => notifier.dispose(),
        child: Consumer<AnimeDetailsNotifier>(
          builder: (_, notifier, __) => AnimeDetailsPage(
            notifier: notifier,
            animeId: animeId,
          ),
        ),
      );

  void _onAnimeDetailsAction(BuildContext context, AnimeDetailsAction action) {
    final homeStrings = HomeStrings.of(context)!;
    if (action is ShowFavoriteAnimeSnackBar) {
      _showSnackBar(context, homeStrings.animeDetailsPageAddedFavorite);
    } else if (action is ShowUnfavoriteAnimeSnackBar) {
      _showSnackBar(context, homeStrings.animeDetailsPageRemovedFavorite);
    } else if (action is ShowFavoriteAnimeErrorSnackBar) {
      _showSnackBar(context, homeStrings.animeDetailsPageToggleFavoriteError);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
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
              child: ReStateActionWidget<AnimeDetailsState, AnimeDetailsAction>(
                reState: notifier,
                onAction: (action) => _onAnimeDetailsAction(context, action),
                builder: (context, state, child) {
                  if (state is AnimeDetailsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is AnimeDetailsError) {
                    return Failure(
                      message: state.error.getErrorMessage(context),
                      buttonText: CoreStrings.of(context)!.tryAgain,
                      onButtonPressed: () => notifier.process(
                        const GetAnimeDetails(),
                      ),
                    );
                  }
                  if (state is AnimeDetailsLoaded) {
                    final animeDetail = state.animeDetails;
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
                            notifier.process(
                              ToggleFavoriteAnime(animeDetails: animeDetail),
                            );
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
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
