import 'package:core/model/result.dart';
import 'package:feature_home/data/cache/anime_cache_data_source.dart';
import 'package:feature_home/data/remote/anime_remote_data_source.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';
import 'package:feature_home/domain/model/genre.dart';
import 'package:feature_home/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl({
    required AnimeRemoteDataSource remoteDataSource,
    required AnimeCacheDataSource cacheDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _cacheDataSource = cacheDataSource;

  final AnimeRemoteDataSource _remoteDataSource;
  final AnimeCacheDataSource _cacheDataSource;

  @override
  Future<Result<AnimeDetails>> getAnimeDetails(int id) async {
    return await _remoteDataSource.getAnimeDetails(id);
  }

  @override
  Future<Result<List<Genre>>> getAnimeGenres() async {
    return await _remoteDataSource.getAnimeGenres();
  }

  @override
  Future<Result<List<Anime>>> getAnimeList() async {
    return await _remoteDataSource.getAnimeList();
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(String query) async {
    return await _remoteDataSource.getAnimeListBySearch(query);
  }
}
