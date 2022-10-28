import 'package:feature_home/src/presentation/anime_list/stores/stores.dart';

class AnimeListController {
  AnimeListController(
    this.genresStore,
    this.animeListStore,
  );

  final GenresStore genresStore;
  final AnimeListStore animeListStore;

  Future<void> getGenres() async {
    await genresStore.getGenres();
  }

  Future<void> getAnimeList() async {
    await animeListStore.getAnimeList();
  }

  Future<void> getAnimesByGenre(String id) async {
    await animeListStore.getAnimesByGenre(id);
  }

  Future<void> getAnimesBySearch(String query) async {
    await animeListStore.getAnimesBySearch(query);
  }
}
