import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_controller.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';
import 'package:feature_home/src/presentation/anime_list/stores/genres_store.dart';
import 'package:flutter/material.dart';

class AnimeGenresFilterRow extends StatelessWidget {
  const AnimeGenresFilterRow({
    Key? key,
    required AnimeListController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final AnimeListController _pageController;

  @override
  Widget build(BuildContext context) {
    return PaddingBox.verticalXS(
      child: ScopedBuilder<GenresStore, Exception, GenresModel>(
        store: _pageController.genresStore,
        onLoading: (_) => const SizedBox(),
        onState: (_, state) {
          final genreList = state.genres;
          return Visibility(
            visible: genreList.isNotEmpty,
            child: FilterSelectChipList(
              onSelected: (isSelected, index) {
                _pageController.getAnimesByGenre(
                  genreList[index].id.toString(),
                  isSelected,
                );
              },
              items: genreList.map((e) => e.name).toList(),
            ),
          );
        },
        onError: (_, error) => const SizedBox(),
      ),
    );
  }
}
