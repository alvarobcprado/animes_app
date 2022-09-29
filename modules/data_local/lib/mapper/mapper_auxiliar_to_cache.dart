import 'package:data_local/model/anime_cache.dart';
import 'package:data_local/model/anime_details_cache.dart';
import 'package:data_local/model/genre_cache.dart';
import 'package:feature_home/data/cache/model/anime_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/anime_details_auxiliar_cache.dart';
import 'package:feature_home/data/cache/model/genre_auxiliar_cache.dart';

extension AnimeListAuxiliarToAnimeListCache on List<AnimeAuxiliarCache> {
  List<AnimeCache> toCache() {
    return map((animeAuxiliarCache) => AnimeCache(
          animeAuxiliarCache.id,
          animeAuxiliarCache.image,
          animeAuxiliarCache.title,
          animeAuxiliarCache.genres,
          animeAuxiliarCache.release,
          animeAuxiliarCache.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsAuxiliarToAnimeDetailsCache on AnimeDetailsAuxiliarCache {
  AnimeDetailsCache toCache() {
    return AnimeDetailsCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListAuxiliarToGenreListCache on List<GenreAuxiliarCache> {
  List<GenreCache> toCache() {
    return map((genreAuxiliarCache) => GenreCache(genreAuxiliarCache.name))
        .toList();
  }
}

extension AnimeAuxiliarToAnimeCache on AnimeAuxiliarCache {
  AnimeCache toCache() {
    return AnimeCache(
      id,
      image,
      title,
      genres,
      release,
      totalEpisodes,
    );
  }
}
