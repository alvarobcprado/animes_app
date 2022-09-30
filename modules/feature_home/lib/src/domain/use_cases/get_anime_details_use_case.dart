import 'package:core/core.dart';

import '../models/anime_details.dart';
import '../repositories/anime_repository.dart';
import 'use_case.dart';

class GetAnimeDetailsUseCase
    implements UseCase<GetAnimeDetailsUseCaseParams, AnimeDetails> {
  GetAnimeDetailsUseCase({
    required AnimeRepository repository,
  }) : _repository = repository;

  final AnimeRepository _repository;

  @override
  Future<Result<AnimeDetails>> call(
      {required GetAnimeDetailsUseCaseParams params}) async {
    return await _repository.getAnimeDetails(params.id);
  }
}

class GetAnimeDetailsUseCaseParams {
  GetAnimeDetailsUseCaseParams({required this.id});

  final int id;
}
