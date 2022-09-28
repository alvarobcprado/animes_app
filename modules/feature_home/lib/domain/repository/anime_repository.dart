import 'package:core/model/result.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';

import 'package:feature_home/domain/model/genre.dart';

abstract class AnimeRepository {
  Future<Result<List<Anime>>> getAnimeList();
  Future<Result<AnimeDetails>> getAnimeDetails(int id);
  Future<Result<List<Genre>>> getAnimeGenres();
  Future<Result<List<Anime>>> getAnimeListBySearch(String query);
}
