import 'home_strings.dart';

/// The translations for Portuguese (`pt`).
class HomeStringsPt extends HomeStrings {
  HomeStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get animeListPageSearchHint => 'Digite o nome do anime que procura';

  @override
  String get animeListPageLabeledCardTitle => 'Title:';

  @override
  String get animeListPageLabeledCardGenre => 'Genre:';

  @override
  String get animeListPageLabeledCardEpisodes => 'Episodes:';

  @override
  String get animeInformationSoon => 'Em breve';

  @override
  String get animeOriginalTitle => 'Título original:';

  @override
  String get animeEnglishTitle => 'Título inglês:';

  @override
  String get animeReleaseDate => 'Data de lançamento:';

  @override
  String get animeEndDate => 'Data de encerramento:';

  @override
  String get animeNote => 'Nota:';

  @override
  String get animeSynopsis => 'Sinopse:';

  @override
  String get animeDetailsPageFavorite => 'Favoritar';

  @override
  String get favoriteAnimesPageTitleAppBar => 'Favoritos';

  @override
  String get favoriteAnimesPageNoAnimes => 'Adicione animes aos seus favoritos';

  @override
  String get animeListNextPageError => 'Não foi possível carregar mais animes';

  @override
  String get animeDetailsPageAddedFavorite => 'Anime adicionado aos favoritos';

  @override
  String get animeDetailsPageRemovedFavorite => 'Anime removido dos favoritos';

  @override
  String get animeDetailsPageToggleFavoriteError => 'Não foi possível adicionar/remover anime dos favoritos';
}
