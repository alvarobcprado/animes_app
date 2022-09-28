import 'package:data_local/model/auxiliar/anime_auxiliar_cache.dart';
import 'package:data_local/model/auxiliar/anime_details_auxiliar_cache.dart';
import 'package:data_local/model/auxiliar/genre_auxiliar_cache.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';

import '../../domain/model/model.dart';

extension AnimeListAuxiliarCacheToAnimeList on List<AnimeAuxiliarCache> {
  List<Anime> toDomain() {
    return map((animeAuxiliarCache) => Anime(
          animeAuxiliarCache.id,
          animeAuxiliarCache.image,
          animeAuxiliarCache.title,
          animeAuxiliarCache.genres,
          animeAuxiliarCache.release,
          animeAuxiliarCache.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsAuxiliarCacheToAnimeDetails on AnimeDetailsAuxiliarCache {
  AnimeDetails toDomain() {
    return AnimeDetails(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListAuxiliarCacheToGenreList on List<GenreAuxiliarCache> {
  List<Genre> toDomain() {
    return map((genreAuxiliarCache) => Genre(genreAuxiliarCache.name)).toList();
  }
}
