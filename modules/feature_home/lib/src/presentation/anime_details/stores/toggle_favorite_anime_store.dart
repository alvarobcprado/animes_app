import 'package:flutter_triple/flutter_triple.dart';

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

  Future<void> toggleFavoriteAnime(int id) async {
    setLoading(true);
    final result = await _toggleFavoriteAnimeUseCase.call(
        params: ToggleFavoriteAnimeUseCaseParams(id: id));
    result.when(success: (_) {
      state.success = true;
      update(state);
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
