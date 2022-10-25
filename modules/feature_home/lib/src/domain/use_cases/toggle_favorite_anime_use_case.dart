import 'package:core/core.dart';

import '../repositories/anime_repository.dart';

class ToggleFavoriteAnimeUseCase
    implements UseCase<ToggleFavoriteAnimeUseCaseParams, void> {
  ToggleFavoriteAnimeUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<void>> call(
      {required ToggleFavoriteAnimeUseCaseParams params}) async {
    return await _repository.toggleFavoriteAnime(params.id);
  }
}

class ToggleFavoriteAnimeUseCaseParams {
  ToggleFavoriteAnimeUseCaseParams({required this.id});

  final int id;
}
