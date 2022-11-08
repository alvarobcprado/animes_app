import 'package:core/core.dart';
import 'package:feature_home/src/data/cache/models/models.dart';

abstract class AnimeCacheDataSource {
  Future<void> saveFavoriteAnime(AnimeDetailsAuxiliarCache anime);
  Future<void> removeFavoriteAnime(int id);
  Future<void> saveAnimeList(List<AnimeAuxiliarCache> animeList);
  Future<void> saveAnimeDetails(AnimeDetailsAuxiliarCache animeDetails);
  Future<void> saveAnimeGenres(List<GenreAuxiliarCache> animeGenres);
  Future<void> saveAnimeListBySearch(List<AnimeAuxiliarCache> animeList);
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeList();
  Future<Result<AnimeDetailsAuxiliarCache>> getAnimeDetails(int id);
  Future<Result<List<GenreAuxiliarCache>>> getAnimeGenres();
  Future<Result<List<AnimeAuxiliarCache>>> getAnimeListBySearch(String query);
  Future<List<AnimeDetailsAuxiliarCache>> getFavoriteAnimes();
  Future<bool> verifyIfAnimeIsFavorite(int animeId);
}
