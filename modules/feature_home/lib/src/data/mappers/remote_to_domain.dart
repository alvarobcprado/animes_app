import 'package:feature_home/src/data/remote/models/models.dart';
import 'package:feature_home/src/domain/models/models.dart';

extension AnimeListResponseToAnimeList on List<AnimeResponse> {
  List<Anime> toDomain() {
    return map((animeResponse) => Anime(
          animeResponse.id ?? -1,
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
  AnimeDetails toDomain() {
    return AnimeDetails(
        id ?? -1,
        title ?? '',
        titleEnglish ?? '',
        images?.image?.url ?? '',
        aired?.release ?? '',
        aired?.end ?? '',
        synopsis ?? '',
        score ?? 0.0);
  }
}

extension GenreListResponseToGenreList on GenreDataResponse {
  List<Genre> toDomain() {
    return genreList
            ?.map((genreResponse) => Genre(genreResponse.name ?? '', genreResponse.id ?? -1))
            .toList() ??
        [];
  }
}
