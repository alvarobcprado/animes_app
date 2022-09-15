import '../../domain/anime.dart';
import '../../domain/anime_details.dart';
import '../model/anime_details/anime_details_response.dart';
import '../model/anime_list/anime_response.dart';
import '../model/genre_list/genre_response.dart';

extension AnimeListResponseToAnimeList on List<AnimeResponse> {
  List<Anime> toAnimeList() {
    return map((animeResponse) => Anime(
          animeResponse.id,
          animeResponse.images?.image?.url ?? '',
          animeResponse.title ?? '',
          animeResponse.genres
                  ?.map((genreResponse) => genreResponse.name ?? '')
                  .toList() ??
              [],
          animeResponse.aired?.release ?? '',
          animeResponse.totalEpisodes ?? -1,
        )).toList();
  }
}

extension AnimeDetailsResponseToAnimeDetails on AnimeDetailsResponse {
  AnimeDetails toAnimeDetails() {
    return AnimeDetails(
        id,
        title ?? '',
        titleEnglish ?? '',
        images?.image?.url ?? '',
        aired?.release ?? '',
        aired?.end ?? '',
        synopsis ?? '',
        score ?? 0.0);
  }
}

extension GenreListResponseToGenreList on List<GenreResponse> {
  List<String> toGenreList() {
    return map((genreResponse) => genreResponse.name ?? '').toList();
  }
}
