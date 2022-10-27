import 'package:feature_home/src/presentation/anime_details/stores/stores.dart';

class AnimeDetailsController {
  AnimeDetailsController(
    this.animeDetailsStore,
    this.toggleFavoriteAnimeStore,
  );

  final AnimeDetailsStore animeDetailsStore;
  final ToggleFavoriteAnimeStore toggleFavoriteAnimeStore;

  Future<void> getAnimeDetails(int id) async {
    await animeDetailsStore.getAnimeDetails(id);
  }

  Future<void> toggleFavoriteAnime(int id) async {
    await toggleFavoriteAnimeStore.toggleFavoriteAnime(id);
  }
}
