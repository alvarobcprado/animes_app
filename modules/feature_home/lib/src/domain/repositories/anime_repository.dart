import 'package:core/core.dart';
import 'package:feature_home/src/domain/models/models.dart';

abstract class AnimeRepository {
  Future<Result<List<Anime>>> getAnimeList();
  Future<Result<AnimeDetails>> getAnimeDetails(int id);
  Future<Result<List<Genre>>> getAnimeGenres();
  Future<Result<List<Anime>>> getAnimeListBySearch(String query);
  Future<Result<void>> toggleFavoriteAnime(int id);
  Future<Result<List<Anime>>> getFavoriteAnimes();
}
