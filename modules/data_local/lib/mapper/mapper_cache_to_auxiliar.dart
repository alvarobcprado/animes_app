import 'package:feature_home/data/cache/model/anime_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/anime_details_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/genre_auxiliar_cache.dart';

import '../model/anime_cache.dart';
import '../model/anime_details_cache.dart';
import '../model/genre_cache.dart';

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
