import 'package:core/core.dart';
import 'package:feature_home/src/domain/models/models.dart';

abstract class AnimeRemoteDataSource {
  Future<Result<List<Anime>>> getAnimeList(int page);
  Future<Result<AnimeDetails>> getAnimeDetails(int animeId);
  Future<Result<List<Genre>>> getAnimeGenres();
  Future<Result<List<Anime>>> getAnimeListBySearch(String query);
  Future<Result<List<Anime>>> getAnimeListByGenre(String genreId, int page);
}
