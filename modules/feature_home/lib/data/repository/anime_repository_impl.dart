import 'package:core/model/result.dart';
import 'package:feature_home/data/remote/anime_remote_data_source.dart';
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
    return _remoteDataSource.getAnimeDetails(id);
  }

  @override
  Future<Result<List<Genre>>> getAnimeGenres() {
    return _remoteDataSource.getAnimeGenres();
  }

  @override
  Future<Result<List<Anime>>> getAnimeList() {
    return _remoteDataSource.getAnimeList();
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(String query) {
    return _remoteDataSource.getAnimeListBySearch(query);
  }
}
