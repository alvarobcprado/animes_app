import 'package:feature_home/data/remote/anime_remote_data_source.dart';
import 'package:core/model/result.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';

import 'package:feature_home/domain/model/genre.dart';
import 'package:feature_home/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl({
    required AnimeRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AnimeRemoteDataSource _remoteDataSource;

  @override
  Future<Result<AnimeDetails>> getAnimeDetails(int id) {
    // TODO: implement getAnimeDetails
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Genre>>> getAnimeGenres() {
    // TODO: implement getAnimeGenres
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Anime>>> getAnimeList() {
    // TODO: implement getAnimeList
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(String query) {
    // TODO: implement getAnimeListBySearch
    throw UnimplementedError();
  }
}
