import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
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
                onError: (_, error) => Failure(
                    message: 'Ocorreu um erro',
                    buttonText: 'Tentar novamente',
                    onButtonPressed: () => _pageController.animeDetailsStore
                        .getAnimeDetails(widget.animeId)),
                onState: (context, state) {
                  final animeDetail = state.animeDetails;
                  if (animeDetail == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      SpacerBox.verticalS(),
                      ImageCardButton(
                        buttonIcon: animeDetail.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        buttonLabel: 'Favoritar',
                        imageUrl: animeDetail.image,
                        onButtonPressed: () {
                          _pageController.toggleFavoriteAnime(animeDetail);
                        },
                      ),
                      SpacerBox.verticalS(),
                      Visibility(
                        visible: animeDetail.title.isNotEmpty,
                        child: RegularRow(
                          title: 'Titulo original',
                          subtitle: animeDetail.title,
                          isLineRestricted: false,
                        ),
                      ),
                      Visibility(
                        visible: animeDetail.titleEnglish.isNotEmpty,
                        child: RegularRow(
                          title: 'Titulo inglês',
                          subtitle: animeDetail.titleEnglish,
                          isLineRestricted: false,
                        ),
                      ),
                      Visibility(
                        visible: animeDetail.release.isNotEmpty,
                        child: RegularRow(
                          title: 'Data de lançamento',
                          subtitle: animeDetail.release,
                          isLineRestricted: false,
                        ),
                      ),
                      Visibility(
                        visible: animeDetail.end.isNotEmpty,
                        child: RegularRow(
                          title: 'Data de encerramento',
                          subtitle: animeDetail.end,
                          isLineRestricted: false,
                        ),
                      ),
                      RegularRow(
                        title: 'Nota',
                        subtitle: animeDetail.score.toString(),
                        isLineRestricted: false,
                      ),
                      Visibility(
                        visible: animeDetail.synopsis.isNotEmpty,
                        child: RegularRow(
                          title: 'Sinopse',
                          subtitle: animeDetail.synopsis,
                          isLineRestricted: false,
                        ),
                      ),
                      SpacerBox.verticalS(),
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
