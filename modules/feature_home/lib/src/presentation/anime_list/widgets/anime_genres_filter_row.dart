import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/src/presentation/anime_list/genre_list_notifier.dart';
import 'package:feature_home/src/presentation/anime_list/models/genre_list_models.dart';
import 'package:flutter/material.dart';

class AnimeGenresFilterRow extends StatelessWidget {
  const AnimeGenresFilterRow({
    Key? key,
    required GenreListNotifier genresNotifier,
    required this.onGenreSelected,
  })  : _genresNotifier = genresNotifier,
        super(key: key);

  final GenreListNotifier _genresNotifier;
  final Function(String, bool) onGenreSelected;

  @override
  Widget build(BuildContext context) {
    return PaddingBox.verticalXS(
      child: ReStateWidget<GenreListState>(
        reState: _genresNotifier,
        builder: (context, state, child) {
          if (state is GenreListLoaded) {
            final genreList = state.genreList;
            return Visibility(
              visible: genreList.isNotEmpty,
              child: FilterSelectChipList(
                onSelected: (isSelected, index) {
                  onGenreSelected(
                    genreList[index].id.toString(),
                    isSelected,
                  );
                },
                items: genreList.map((e) => e.name).toList(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
