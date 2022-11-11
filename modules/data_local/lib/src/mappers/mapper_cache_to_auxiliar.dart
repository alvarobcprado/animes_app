import 'package:data_local/src/models/models.dart';
import 'package:feature_home/feature_home.dart';

extension AnimeListCacheToAnimeListAuxiliar on List<AnimeCache> {
  List<AnimeAuxiliarCache> toCacheAuxiliar() {
    return map((animeCache) => AnimeAuxiliarCache(
          animeCache.id,
          animeCache.image,
          animeCache.title,
          animeCache.genres,
          animeCache.release,
          animeCache.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsCacheToAnimeDetailsAuxiliar on AnimeDetailsCache {
  AnimeDetailsAuxiliarCache toCacheAuxiliar() {
    return AnimeDetailsAuxiliarCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListCacheToGenreListAuxiliar on List<GenreCache> {
  List<GenreAuxiliarCache> toCacheAuxiliar() {
    return map((genreCache) => GenreAuxiliarCache(genreCache.name)).toList();
  }
}

extension AnimeCacheToAnimeAuxiliar on AnimeCache {
  AnimeAuxiliarCache toCacheAuxiliar() {
    return AnimeAuxiliarCache(
      id,
      image,
      title,
      genres,
      release,
      totalEpisodes,
    );
  }
}

extension AnimeDetailsListCacheToAnimeDetailsListAuxiliar on List<AnimeDetailsCache> {
  List<AnimeDetailsAuxiliarCache> toCacheAuxiliar() {
    return map((animeDetailsCache) => AnimeDetailsAuxiliarCache(
          animeDetailsCache.id,
          animeDetailsCache.title,
          animeDetailsCache.titleEnglish,
          animeDetailsCache.image,
          animeDetailsCache.release,
          animeDetailsCache.end,
          animeDetailsCache.synopsis,
          animeDetailsCache.score,
        )).toList();
  }
}
