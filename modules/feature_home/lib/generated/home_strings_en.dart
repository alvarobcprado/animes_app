import 'home_strings.dart';

/// The translations for English (`en`).
class HomeStringsEn extends HomeStrings {
  HomeStringsEn([String locale = 'en']) : super(locale);

  @override
  String get animeListPageSearchHint => 'Enter the anime name you are looking for';

  @override
  String get animeListPageLabeledCardTitle => 'Title:';

  @override
  String get animeListPageLabeledCardGenre => 'Genre:';

  @override
  String get animeListPageLabeledCardEpisodes => 'Episodes:';

  @override
  String get animeInformationSoon => 'Em breve';

  @override
  String get animeOriginalTitle => 'Original title:';

  @override
  String get animeEnglishTitle => 'English title:';

  @override
  String get animeReleaseDate => 'Release:';

  @override
  String get animeEndDate => 'End:';

  @override
  String get animeNote => 'Note:';

  @override
  String get animeSynopsis => 'Synopsis:';

  @override
  String get animeDetailsPageFavorite => 'Favorite';

  @override
  String get favoriteAnimesPageTitleAppBar => 'Favorites';

  @override
  String get favoriteAnimesPageNoAnimes => 'Add anime to your favorites';

  @override
  String get animeListNextPageError => 'Error loading more animes';

  @override
  String get animeDetailsPageAddedFavorite => 'Anime added to favorites';

  @override
  String get animeDetailsPageRemovedFavorite => 'Anime removed from favorites';

  @override
  String get animeDetailsPageToggleFavoriteError => 'Error adding anime to favorites';
}
