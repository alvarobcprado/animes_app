import 'package:core/core.dart';

import '../models/anime_details.dart';
import '../repositories/anime_repository.dart';

class GetFavoriteAnimesUseCase implements UseCase<void, List<AnimeDetails>> {
  GetFavoriteAnimesUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<List<AnimeDetails>>> call({required params}) async {
    return await _repository.getFavoriteAnimes();
  }
}
