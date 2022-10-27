import 'dart:async';

import 'package:core/core.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/data/cache/cache.dart';
import 'package:feature_home/src/data/remote/remote.dart';
import 'package:feature_home/src/domain/models/models.dart';
import 'package:feature_home/src/domain/repositories/repositories.dart';

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
    final result = await _remoteDataSource.getAnimeGenres();
    return result.when(success: (genreList) async {
      await _cacheDataSource.saveAnimeGenres(genreList.toCache());
      return await _getGenreListFromCache();
    }, error: (error) async {
      return await _getGenreListFromCache();
    });
  }

  Future<FutureOr<Result<List<Genre>>>> _getGenreListFromCache() async {
    final resultCache = await _cacheDataSource.getAnimeGenres();
    return resultCache.when(success: (genresCache) {
      return Result.success(genresCache.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  @override
  Future<Result<List<Anime>>> getAnimeList() async {
    return await _remoteDataSource.getAnimeList();
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(String query) async {
    return await _remoteDataSource.getAnimeListBySearch(query);
  }

  @override
  Future<Result<List<Anime>>> getFavoriteAnimes() {
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> toggleFavoriteAnime(int id) {
    throw UnimplementedError();
  }
}
