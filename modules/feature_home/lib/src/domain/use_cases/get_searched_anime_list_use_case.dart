import 'package:core/core.dart';

import '../models/anime.dart';
import '../repositories/anime_repository.dart';

class GetSearchedAnimeListUseCase
    implements UseCase<GetSearchedAnimeListUseCaseParams, List<Anime>> {
  GetSearchedAnimeListUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<Anime>>> call(
      {required GetSearchedAnimeListUseCaseParams params}) async {
    return await _repository.getAnimeListBySearch(params.query);
  }
}

class GetSearchedAnimeListUseCaseParams {
  GetSearchedAnimeListUseCaseParams({
    required this.query,
  });

  final String query;
}
