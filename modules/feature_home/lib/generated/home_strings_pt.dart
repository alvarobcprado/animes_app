import 'home_strings.dart';

/// The translations for Portuguese (`pt`).
class HomeStringsPt extends HomeStrings {
  HomeStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get animeDetailsPageOriginalTitle => 'Título original:';

  @override
  String get animeDetailsPageEnglishTitle => 'Título inglês:';

  @override
  String get animeDetailsPageRelease => 'Data de lançamento:';

  @override
  String get animeDetailsPageEnd => 'Data de encerramento:';

  @override
  String get animeDetailsPageNote => 'Nota:';

  @override
  String get animeDetailsPageSynopsis => 'Sinopse:';

  @override
  String get animeDetailsPageFavorite => 'Favoritar';
}
