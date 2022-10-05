import 'package:core/core.dart';

import '../models/genre.dart';
import '../repositories/anime_repository.dart';

class GetAnimeGenresUseCase implements UseCase<void, List<Genre>> {
  GetAnimeGenresUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<Genre>>> call({required params}) async {
    return await _repository.getAnimeGenres();
  }
}
