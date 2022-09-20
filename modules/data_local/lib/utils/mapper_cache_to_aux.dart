import '../model/anime_cache.dart';
import '../model/anime_details_cache.dart';
import '../model/aux/anime_auxiliar_cache.dart';
import '../model/aux/anime_details_auxiliar_cache.dart';
import '../model/genre_cache.dart';

extension AnimeListCacheToAnimeListAux on List<AnimeCache> {
  List<AnimeAuxiliarCache> toAnimeListAux() {
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

extension AnimeDetailsCacheToAnimeDetailsAux on AnimeDetailsCache {
  AnimeDetailsAuxiliarCache toAnimeDetailsAux() {
    return AnimeDetailsAuxiliarCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListCacheToGenreListAux on List<GenreCache> {
  List<String> toGenreListAux() {
    return map((genreCache) => genreCache.name).toList();
  }
}
