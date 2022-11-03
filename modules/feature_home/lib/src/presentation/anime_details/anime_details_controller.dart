import 'package:feature_home/feature_home.dart';
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

  Future<void> toggleFavoriteAnime(AnimeDetails animeDetails) async {
    await toggleFavoriteAnimeStore.toggleFavoriteAnime(animeDetails);
  }
}
