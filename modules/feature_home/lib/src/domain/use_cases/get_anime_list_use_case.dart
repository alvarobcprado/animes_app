import 'package:core/core.dart';

import '../models/anime.dart';
import '../repositories/anime_repository.dart';

class GetAnimeListUseCase
    implements UseCase<GetAnimeListUseCaseParams, List<Anime>> {
  GetAnimeListUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<Anime>>> call({required params}) async {
    return await _repository.getAnimeList(params.page);
  }
}

class GetAnimeListUseCaseParams {
  GetAnimeListUseCaseParams({
    required this.page,
  });

  final int page;
}
