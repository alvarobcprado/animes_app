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

final mockAnimeDetailsList = [
  AnimeDetails(1, 'title1', 'titleEnglish1', 'image1', 'release1', 'end1',
      'synopsis1', 1,
      isFavorite: true),
  AnimeDetails(2, 'title2', 'titleEnglish2', 'image2', 'release2', 'end2',
      'synopsis2', 2,
      isFavorite: true),
  AnimeDetails(3, 'title3', 'titleEnglish3', 'image3', 'release3', 'end3',
      'synopsis3', 3,
      isFavorite: true),
  AnimeDetails(4, 'title4', 'titleEnglish4', 'image4', 'release4', 'end4',
      'synopsis1', 4,
      isFavorite: true),
  AnimeDetails(5, 'title5', 'titleEnglish5', 'image5', 'release5', 'end5',
      'synopsis5', 5,
      isFavorite: true),
];
