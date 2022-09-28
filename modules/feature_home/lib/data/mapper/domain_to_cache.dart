import 'package:data_local/model/auxiliar/anime_details_auxiliar_cache.dart';
import 'package:data_local/model/auxiliar/genre_auxiliar_cache.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';

import '../../domain/model/genre.dart';

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
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListToGenreListAuxCache on List<Genre> {
  List<GenreAuxiliarCache> toCache() {
    return map((genre) => GenreAuxiliarCache(genre.name)).toList();
  }
}
