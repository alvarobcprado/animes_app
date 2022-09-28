import 'package:data_local/model/auxiliar/genre_auxiliar_cache.dart';
import '../model/anime_cache.dart';
import '../model/anime_details_cache.dart';
import '../model/auxiliar/anime_auxiliar_cache.dart';
import '../model/auxiliar/anime_details_auxiliar_cache.dart';
import '../model/genre_cache.dart';

extension AnimeListCacheToAnimeListAuxiliar on List<AnimeCache> {
  List<AnimeAuxiliarCache> toAnimeListAuxiliar() {
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
  AnimeDetailsAuxiliarCache toAnimeDetailsAuxiliar() {
    return AnimeDetailsAuxiliarCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListCacheToGenreListAuxiliar on List<GenreCache> {
  List<GenreAuxiliarCache> toGenreListAuxiliar() {
    return map((genreCache) => GenreAuxiliarCache(genreCache.name)).toList();
  }
}
