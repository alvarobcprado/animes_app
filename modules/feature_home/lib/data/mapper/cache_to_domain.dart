import 'package:data/model/aux/anime_aux_cache.dart';
import 'package:data/model/aux/anime_details_aux_cache.dart';
import 'package:data/model/aux/genre_aux_cache.dart';
import '../../domain/anime.dart';
import '../../domain/anime_details.dart';

extension AnimeListAuxCacheToAnimeList on List<AnimeAuxCache> {
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

extension AnimeDetailsAuxCacheToAnimeDetails on AnimeDetailsAuxCache {
  AnimeDetails toAnimeDetails() {
    return AnimeDetails(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListAuxCacheToGenreList on List<GenreAuxCache> {
  List<String> toGenreList() {
    return map((genreCache) => genreCache.name).toList();
  }
}
