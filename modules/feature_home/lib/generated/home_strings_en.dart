import 'home_strings.dart';

/// The translations for English (`en`).
class HomeStringsEn extends HomeStrings {
  HomeStringsEn([String locale = 'en']) : super(locale);

  @override
  String get animeDetailsPageOriginalTitle => 'Original title:';

  @override
  String get animeDetailsPageEnglishTitle => 'English title:';

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
