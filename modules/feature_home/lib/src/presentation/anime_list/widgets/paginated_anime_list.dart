import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_controller.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';
import 'package:feature_home/src/presentation/anime_list/stores/anime_list_store.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/anime_list_page_floating_action_buttons.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/next_anime_page_loading_indicator.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/raw_anime_list.dart';
import 'package:flutter/material.dart';

class PaginatedAnimeList extends StatelessWidget {
  const PaginatedAnimeList({
    Key? key,
    required AnimeListController pageController,
    required ScrollController scrollController,
  })  : _pageController = pageController,
        _scrollController = scrollController,
        super(key: key);

  final AnimeListController _pageController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return Expanded(
      child: ScopedBuilder<AnimeListStore, Exception, AnimesModel>(
        store: _pageController.animeListStore,
        onLoading: (_) => Center(
          child: CircularProgressIndicator(
            color: colors.primary,
          ),
        ),
        onState: (_, state) {
          final animeList = state.animes;
          return Visibility(
            visible: animeList.isNotEmpty,
            replacement: const Text('lista vazia'),
            child: Stack(
              children: [
                RawAnimeList(
                  scrollController: _scrollController,
                  animeList: animeList,
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
        onError: (_, error) {
          final message = error!.getErrorMessage(context);
          return Failure(
            message: message,
            buttonText: CoreStrings.of(context)!.tryAgain,
            onButtonPressed: () =>
                _pageController.animeListStore.getAnimeList(),
          );
        },
      ),
    );
  }
}
