import 'package:feature_home/feature_home.dart';

final mockAnimeDetails = AnimeDetails(
  1,
  'title',
  'titleEnglish',
  'imageUrl',
  'releaseDate',
  'endDate',
  'synopsis',
  9,
  isFavorite: false,
);

final mockAnimeDetailsAuxiliarCache = AnimeDetailsAuxiliarCache(
  1,
  'title',
  'titleEnglish',
  'imageUrl',
  'releaseDate',
  'endDate',
  'synopsis',
  9,
);

final mockAnimeGenreList = [
  Genre('genreName1', 1),
  Genre('genreName2', 2),
  Genre('genreName3', 3),
  Genre('genreName4', 4),
  Genre('genreName5', 5),
];

final mockAnimeList = [
  Anime(1, 'imageUrl1', 'title1', ['mockGenre'], 'release1', 1),
  Anime(2, 'imageUrl2', 'title2', ['mockGenre'], 'release2', 2),
  Anime(3, 'imageUrl3', 'title3', ['mockGenre'], 'release3', 3),
  Anime(4, 'imageUrl4', 'title4', ['mockGenre'], 'release4', 4),
  Anime(5, 'imageUrl5', 'title5', ['mockGenre'], 'release5', 5),
];
