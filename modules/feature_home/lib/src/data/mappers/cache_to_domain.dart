import 'package:feature_home/src/data/cache/models/models.dart';
import 'package:feature_home/src/domain/models/models.dart';

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
      id,
      title,
      titleEnglish,
      image,
      release,
      end,
      synopsis,
      score,
    );
  }
}

extension GenreListAuxiliarCacheToGenreList on List<GenreAuxiliarCache> {
  List<Genre> toDomain() {
    return map((genreAuxiliarCache) => Genre(genreAuxiliarCache.name)).toList();
  }
}
