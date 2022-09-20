import 'package:data_local/model/aux/anime_auxiliar_cache.dart';
import 'package:data_local/model/aux/anime_details_auxiliar_cache.dart';
import 'package:data_local/model/aux/genre_auxiliar_cache.dart';
import '../../domain/anime.dart';
import '../../domain/anime_details.dart';

extension AnimeListAuxCacheToAnimeList on List<AnimeAuxiliarCache> {
  List<Anime> toAnimeList() {
    return map((animeCache) => Anime(
          animeCache.id,
          animeCache.image,
          animeCache.title,
          animeCache.genres,
          animeCache.release,
          animeCache.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsAuxCacheToAnimeDetails on AnimeDetailsAuxiliarCache {
  AnimeDetails toAnimeDetails() {
    return AnimeDetails(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListAuxCacheToGenreList on List<GenreAuxiliarCache> {
  List<String> toGenreList() {
    return map((genreCache) => genreCache.name).toList();
  }
}
