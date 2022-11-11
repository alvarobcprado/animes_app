import 'package:core/core.dart';
import 'package:feature_home/src/domain/models/models.dart';

abstract class AnimeRepository {
  Future<Result<List<Anime>>> getAnimeList(int page);
  Future<Result<AnimeDetails>> getAnimeDetails(int id);
  Future<Result<List<Genre>>> getAnimeGenres();
  Future<Result<void>> toggleFavoriteAnime(AnimeDetails animeDetails);
  Future<Result<List<AnimeDetails>>> getFavoriteAnimes();
  Future<Result<List<Anime>>> getAnimeListBySearch(String query, int page);
  Future<Result<List<Anime>>> getAnimeListByGenre(String id, int page);
}
