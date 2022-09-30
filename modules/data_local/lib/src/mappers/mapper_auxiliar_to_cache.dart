import 'package:data_local/src/models/models.dart';
import 'package:feature_home/feature_home.dart';

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
