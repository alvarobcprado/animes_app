import 'dart:async';

import 'package:core/core.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/data/cache/cache.dart';
import 'package:feature_home/src/data/mappers/cache_to_domain.dart';
import 'package:feature_home/src/data/mappers/domain_to_cache.dart';
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
    final result = await _remoteDataSource.getAnimeDetails(id);
    return result.when(success: (animeDetails) async {
      await _cacheDataSource.saveAnimeDetails(animeDetails.toCache());
      animeDetails.isFavorite =
          await _cacheDataSource.verifyIfAnimeIsFavorite(id);
      return Result.success(animeDetails);
    }, error: (error) async {
      return await _getAnimeDetailsFromCache(id);
    });
  }

  Future<Result<AnimeDetails>> _getAnimeDetailsFromCache(int id) async {
    final resultCache = await _cacheDataSource.getAnimeDetails(id);
    return resultCache.when(success: (animeDetailsCache) async {
      final animeDetails = animeDetailsCache.toDomain();
      animeDetails.isFavorite =
          await _cacheDataSource.verifyIfAnimeIsFavorite(id);
      return Result.success(animeDetails);
    }, error: (error) async {
      return Result.error(error);
    });
  }

  @override
  Future<Result<List<Genre>>> getAnimeGenres() async {
    final result = await _remoteDataSource.getAnimeGenres();
    return result.when(success: (genreList) async {
      await _cacheDataSource.saveAnimeGenres(genreList.toCache());
      return Result.success(genreList);
    }, error: (error) async {
      return await _getGenreListFromCache();
    });
  }

  Future<Result<List<Genre>>> _getGenreListFromCache() async {
    final resultCache = await _cacheDataSource.getAnimeGenres();
    return resultCache.when(success: (genresCache) {
      return Result.success(genresCache.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  @override
  Future<Result<List<Anime>>> getAnimeList(int page) async {
    return await _remoteDataSource.getAnimeList(page);
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(
    String query,
    int page,
  ) async {
    return await _remoteDataSource.getAnimeListBySearch(query, page);
  }

  @override
  Future<Result<List<Anime>>> getAnimeListByGenre(String id, int page) async {
    return await _remoteDataSource.getAnimeListByGenre(id, page);
  }

  @override
  Future<Result<List<AnimeDetails>>> getFavoriteAnimes() async {
    final favoritesAnimes = await _cacheDataSource.getFavoriteAnimes();
    return Result.success(favoritesAnimes.toDomain());
  }

  @override
  Future<Result<void>> toggleFavoriteAnime(AnimeDetails animeDetails) async {
    if (animeDetails.isFavorite) {
      return Result.success(
          await _cacheDataSource.removeFavoriteAnime(animeDetails.id));
    }
    return Result.success(
        await _cacheDataSource.saveFavoriteAnime(animeDetails.toCache()));
  }
}
