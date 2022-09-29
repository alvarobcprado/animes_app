import 'package:core/model/exceptions.dart';
import 'package:core/model/result.dart';
import 'package:data_local/mapper/mapper_auxiliar_to_cache.dart';
import 'package:data_local/mapper/mapper_cache_to_auxiliar.dart';
import 'package:data_local/model/anime_cache.dart';
import 'package:data_local/model/anime_details_cache.dart';
import 'package:data_local/model/genre_cache.dart';
import 'package:data_local/utils/box_key.dart';
import 'package:data_local/utils/box_name.dart';
import 'package:feature_home/data/cache/anime_cache_data_source.dart';
import 'package:feature_home/data/cache/model/anime_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/anime_details_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/genre_auxiliar_cache.dart';
import 'package:hive/hive.dart';

class AnimeCacheDataSourceImpl implements AnimeCacheDataSource {
  AnimeCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;

  @override
  Future<Result<AnimeDetailsAuxiliarCache>> getAnimeDetails(int id) async {
    final box = await _hive.openBox<AnimeDetailsCache>(BoxName.animeDetails);
    final animeDetailsCache = box.get(id);
    if (animeDetailsCache != null) {
      return Result.success(animeDetailsCache.toCacheAuxiliar());
    }
    return Result.error(NullCacheException());
  }

  @override
  Future<Result<List<GenreAuxiliarCache>>> getAnimeGenres() async {
    final box = await _hive.openBox(BoxName.animeGenres);
    final genresCache = List<GenreCache>.from(box.get(BoxKey.animeGenres));
    return Result.success(genresCache.toCacheAuxiliar());
  }

  @override
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeList() async {
    final box = await _hive.openBox(BoxName.animeList);
    final animeListCache = List<AnimeCache>.from(box.values);
    return Result.success(animeListCache.toCacheAuxiliar());
  }

  @override
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeListBySearch(
      String query) async {
    final box = await _hive.openBox(BoxName.searchedAnime);
    final animeListCache = List<AnimeCache>.from(box.values);
    return Result.success(animeListCache.toCacheAuxiliar());
  }

  @override
  Future<Result<List<AnimeAuxiliarCache>>> getFavoriteAnimes() async {
    final box = await _hive.openBox(BoxName.favoriteAnimes);
    final favoritesCache = List<AnimeCache>.from(box.values);
    return Result.success(favoritesCache.toCacheAuxiliar());
  }

  @override
  Future<void> removeFavoriteAnime(int id) async {
    final box = await _hive.openBox(BoxName.favoriteAnimes);
    await box.delete(id);
  }

  @override
  Future<void> saveAnimeDetails(AnimeDetailsAuxiliarCache animeDetails) async {
    final animeDetailsCache = animeDetails.toCache();
    final box = await _hive.openBox(BoxName.animeDetails);
    await box.put(animeDetailsCache.id, animeDetailsCache);
  }

  @override
  Future<void> saveAnimeGenres(List<GenreAuxiliarCache> animeGenres) async {
    final genresCache = animeGenres.toCache();
    final box = await _hive.openBox(BoxName.animeGenres);
    await box.putAll({BoxKey.animeGenres: genresCache});
  }

  @override
  Future<void> saveAnimeList(List<AnimeAuxiliarCache> animeList) async {
    final animeListCache = animeList.toCache();
    final box = await _hive.openBox(BoxName.animeList);
    animeListCache.map((item) async => await box.put(item.id, item));
  }

  @override
  Future<void> saveAnimeListBySearch(List<AnimeAuxiliarCache> animeList) async {
    final animeListCache = animeList.toCache();
    final box = await _hive.openBox(BoxName.searchedAnime);
    animeListCache.map((item) async => await box.put(item.id, item));
  }

  @override
  Future<void> saveFavoriteAnime(AnimeAuxiliarCache anime) async {
    final animeCache = anime.toCache();
    final box = await _hive.openBox(BoxName.favoriteAnimes);
    await box.put(animeCache.id, animeCache);
  }
}
