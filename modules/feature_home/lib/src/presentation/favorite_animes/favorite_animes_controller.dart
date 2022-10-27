import 'package:feature_home/src/presentation/favorite_animes/stores/stores.dart';

class FavoriteAnimesController {
  FavoriteAnimesController(
    this.favoriteAnimesStore,
  );

  final FavoriteAnimesStore favoriteAnimesStore;

  Future<void> getFavoriteAnimes() async {
    await favoriteAnimesStore.getFavoriteAnimes();
  }
}
