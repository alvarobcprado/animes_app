import 'home_strings.dart';

/// The translations for Portuguese (`pt`).
class HomeStringsPt extends HomeStrings {
  HomeStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get animeListPageSearchHint => 'Digite o nome do anime que procura';

  @override
  String get animeListPageLabeledCardTitle => 'Título:';

  @override
  String get animeListPageLabeledCardGenre => 'Gênero:';

  @override
  String get animeListPageLabeledCardEpisodes => 'Episódios:';

  @override
  String get animeListPageLabeledCardRelease => 'Data de lançamento:';

  @override
  String get animeListPageInformationSoon => 'Em breve';
}
