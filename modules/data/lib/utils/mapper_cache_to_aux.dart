import '../model/anime_cache.dart';
import '../model/anime_details_cache.dart';
import '../model/aux/anime_aux_cache.dart';
import '../model/aux/anime_details_aux_cache.dart';
import '../model/genre_cache.dart';

extension AnimeListCacheToAnimeListAux on List<AnimeCache> {
  List<AnimeAuxCache> toAnimeListAux() {
    return map((animeCache) => AnimeAuxCache(
          animeCache.id,
          animeCache.image,
          animeCache.title,
          animeCache.genres,
          animeCache.release,
          animeCache.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsCacheToAnimeDetailsAux on AnimeDetailsCache {
  AnimeDetailsAuxCache toAnimeDetailsAux() {
    return AnimeDetailsAuxCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListCacheToGenreListAux on List<GenreCache> {
  List<String> toGenreListAux() {
    return map((genreCache) => genreCache.name).toList();
  }
}
