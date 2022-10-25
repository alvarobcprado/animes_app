import 'package:core/core.dart';

import '../models/anime.dart';
import '../repositories/anime_repository.dart';

class GetFavoriteAnimesUseCase implements UseCase<void, List<Anime>> {
  GetFavoriteAnimesUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<Anime>>> call({required params}) async {
    return await _repository.getFavoriteAnimes();
  }
}
