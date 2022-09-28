import 'package:feature_home/data/model/genre_list/genre_data_response.dart';
import '../../domain/model/model.dart';
import '../model/anime_details/anime_details_response.dart';
import '../model/anime_list/anime_response.dart';

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
    return data
            ?.map((genreResponse) => Genre(genreResponse.name ?? ''))
            .toList() ??
        [];
  }
}
