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
  String get animeDetailsPageOriginalTitle => 'Original title:';

  @override
  String get animeDetailsPageEnglishTitle => 'English title:';

  @override
  String get animeListPageLabeledCardRelease => 'Release:';

  @override
  String get animeListPageInformationSoon => 'Em breve';
  @override
  String get animeDetailsPageRelease => 'Release:';

  @override
  String get animeDetailsPageEnd => 'End:';

  @override
  String get animeDetailsPageNote => 'Note:';

  @override
  String get animeDetailsPageSynopsis => 'Synopsis:';

  @override
  String get animeDetailsPageFavorite => 'Favorite';
}
