import 'package:core/model/result.dart';
import 'package:feature_home/data/cache/model/anime_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/anime_details_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/genre_auxiliar_cache.dart';

abstract class AnimeCacheDataSource {
  Future<void> saveFavoriteAnime(AnimeAuxiliarCache anime);
  Future<void> removeFavoriteAnime(int id);
  Future<void> saveAnimeList(List<AnimeAuxiliarCache> animeList);
  Future<void> saveAnimeDetails(AnimeDetailsAuxiliarCache animeDetails);
  Future<void> saveAnimeGenres(List<GenreAuxiliarCache> animeGenres);
  Future<void> saveAnimeListBySearch(List<AnimeAuxiliarCache> animeList);
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeList();
  Future<Result<AnimeDetailsAuxiliarCache>> getAnimeDetails(int id);
  Future<Result<List<GenreAuxiliarCache>>> getAnimeGenres();
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeListBySearch(String query);
  Future<Result<List<AnimeAuxiliarCache>>> getFavoriteAnimes();
}
