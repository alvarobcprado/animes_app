import 'package:data_local/model/aux/anime_details_auxiliar_cache.dart';
import '../../domain/anime.dart';
import '../../domain/anime_details.dart';
import '../../domain/genre.dart';

extension AnimeListToAnimeListAuxCache on List<Anime> {
  List<Anime> toAnimeListAuxCache() {
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
  AnimeDetailsAuxiliarCache toAnimeDetailsAuxCache() {
    return AnimeDetailsAuxiliarCache(
        id, title, titleEnglish, image, release, end, synopsis, score);
  }
}

extension GenreListToGenreListAuxCache on List<Genre> {
  List<String> toGenreListAuxCache() {
    return map((genre) => genre.name).toList();
  }
}
