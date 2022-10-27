import 'package:feature_home/src/data/cache/models/models.dart';
import 'package:feature_home/src/domain/models/models.dart';

extension AnimeListToAnimeListAuxCache on List<Anime> {
  List<Anime> toCache() {
    return map((anime) => Anime(
          anime.id,
          anime.image,
          anime.title,
          anime.genres,
          anime.release,
          anime.totalEpisodes,
        )).toList();
  }
}

extension AnimeDetailsToAnimeDetailsAuxCache on AnimeDetails {
  AnimeDetailsAuxiliarCache toCache() {
    return AnimeDetailsAuxiliarCache(
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

extension GenreListToGenreListAuxCache on List<Genre> {
  List<GenreAuxiliarCache> toCache() {
    return map((genre) => GenreAuxiliarCache(genre.name, genre.id)).toList();
  }
}
