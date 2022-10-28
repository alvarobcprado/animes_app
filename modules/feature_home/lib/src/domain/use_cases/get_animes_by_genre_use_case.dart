import 'package:core/core.dart';

import '../models/anime.dart';
import '../repositories/anime_repository.dart';

class GetAnimesByGenreUseCase
    implements UseCase<GetAnimesByGenreUseCaseParams, List<Anime>> {
  GetAnimesByGenreUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<Anime>>> call(
      {required GetAnimesByGenreUseCaseParams params}) async {
    return await _repository.getAnimeListByGenre(params.id);
  }
}

class GetAnimesByGenreUseCaseParams {
  GetAnimesByGenreUseCaseParams({required this.id});

  final String id;
}
