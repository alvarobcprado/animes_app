import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_details/stores/stores.dart';

class AnimeDetailsController {
  AnimeDetailsController(
    this.animeDetailsStore,
  );

  final AnimeDetailsStore animeDetailsStore;

  Future<void> getAnimeDetails(int id) async {
    await animeDetailsStore.getAnimeDetails(id);
  }

  Future<void> toggleFavoriteAnime(AnimeDetails animeDetails) async {
    await animeDetailsStore.toggleFavoriteAnime(animeDetails);
  }
}
