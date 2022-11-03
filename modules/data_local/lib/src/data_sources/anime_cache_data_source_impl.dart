import 'package:core/core.dart';
import 'package:core/dependencies/storage.dart';
import 'package:data_local/src/mappers/mappers.dart';
import 'package:data_local/src/models/models.dart';
import 'package:data_local/src/utils/utils.dart';
import 'package:feature_home/feature_home.dart';

class AnimeCacheDataSourceImpl implements AnimeCacheDataSource {
  AnimeCacheDataSourceImpl({
    required HiveInterface hive,
  }) : _hive = hive;

  final HiveInterface _hive;

  @override
  Future<Result<AnimeDetailsAuxiliarCache>> getAnimeDetails(int id) async {
    final box = await _hive.openBox(BoxName.animeDetails);
    final AnimeDetailsCache? animeDetailsCache = box.get(id);
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
  Future<List<AnimeDetailsAuxiliarCache>> getFavoriteAnimes() async {
    final box = await _hive.openBox(BoxName.favoriteAnimes);
    final favoritesAnimesCache = List<AnimeDetailsCache>.from(box.values);
    return favoritesAnimesCache.toCacheAuxiliar();
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
  Future<void> saveFavoriteAnime(AnimeDetailsAuxiliarCache anime) async {
    final animeCache = anime.toCache();
    final box = await _hive.openBox(BoxName.favoriteAnimes);
    await box.put(animeCache.id, animeCache);
  }
}
