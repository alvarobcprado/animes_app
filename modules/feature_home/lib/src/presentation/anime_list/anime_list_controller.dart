import 'package:feature_home/src/presentation/anime_list/stores/stores.dart';

class AnimeListController {
  AnimeListController(
    this.genresStore,
    this.animeListStore,
    this.searchedAnimesStore,
  );

  final GenresStore genresStore;
  final AnimeListStore animeListStore;
  final SearchedAnimeListStore searchedAnimesStore;

  Future<void> getGenres() async {
    await genresStore.getGenres();
  }

  Future<void> getAnimeList() async {
    await animeListStore.getAnimeList();
  }

  Future<void> getSearchedAnimes(String query) async {
    await searchedAnimesStore.getSearchedAnimes(query);
  }
}
