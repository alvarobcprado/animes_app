import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_notifier.dart';
import 'package:feature_home/src/presentation/anime_list/models/anime_list_models.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/anime_list_page_floating_action_buttons.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/next_anime_page_error_indicator.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/next_anime_page_loading_indicator.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/raw_anime_list.dart';
import 'package:flutter/material.dart';

class PaginatedAnimeList extends StatelessWidget {
  const PaginatedAnimeList({
    Key? key,
    required AnimeListNotifier animeListNotifier,
    required ScrollController scrollController,
  })  : _animeListNotifier = animeListNotifier,
        _scrollController = scrollController,
        super(key: key);

  final AnimeListNotifier _animeListNotifier;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReStateWidget<AnimeListModel>(
        reState: _animeListNotifier,
        builder: (context, state, child) {
          if (state.error != null) {
            final message = state.error!.getErrorMessage(context);
            return Failure(
              message: message,
              buttonText: CoreStrings.of(context)!.tryAgain,
              onButtonPressed: () => _animeListNotifier.process(
                const GetAnimes(),
              ),
            );
          }

          if (state == AnimeListModel.loading()) {
            return const Center(child: CircularProgressIndicator());
          }

          final animeList = state.animes;
          return Visibility(
            visible: animeList.isNotEmpty,
            replacement: const Text('lista vazia'),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: RawAnimeList(
                          scrollController: _scrollController,
                          animeList: animeList,
                        ),
                      ),
                      NextAnimePageErrorIndicator(
                        hasPaginationError: state.hasPaginationError,
                        onTryAgainTap: () => _animeListNotifier.process(
                          const GetNextAnimeListPage(),
                        ),
                      ),
                    ],
                  ),
                ),
                NextAnimePageLoadingIndicator(
                  isLoadingNewPage: state.isLoadingNewPage,
                ),
                AnimeListPageFloatingActionButtons(
                  scrollController: _scrollController,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
