import 'package:core/core.dart';

import '../models/anime_details.dart';
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
    return await _repository.toggleFavoriteAnime(params.animeDetails);
  }
}

class ToggleFavoriteAnimeUseCaseParams {
  ToggleFavoriteAnimeUseCaseParams({required this.animeDetails});

  final AnimeDetails animeDetails;
}
