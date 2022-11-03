import 'package:core/dependencies/state_management.dart';

import '../../../domain/models/anime_details.dart';
import '../../../domain/use_cases/toggle_favorite_anime_use_case.dart';

class ToggleFavoriteAnimeModel {
  ToggleFavoriteAnimeModel({
    this.success = false,
  });

  bool success;
}

class ToggleFavoriteAnimeStore
    extends StreamStore<Exception, ToggleFavoriteAnimeModel> {
  ToggleFavoriteAnimeStore({
    required ToggleFavoriteAnimeUseCase toggleFavoriteAnimeUseCase,
  })  : _toggleFavoriteAnimeUseCase = toggleFavoriteAnimeUseCase,
        super(ToggleFavoriteAnimeModel());

  final ToggleFavoriteAnimeUseCase _toggleFavoriteAnimeUseCase;

  Future<void> toggleFavoriteAnime(AnimeDetails animeDetails) async {
    setLoading(true);
    final result = await _toggleFavoriteAnimeUseCase.call(
        params: ToggleFavoriteAnimeUseCaseParams(animeDetails: animeDetails));
    result.when(success: (_) {
      update(ToggleFavoriteAnimeModel(success: true));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
