import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/src/domain/use_cases/get_searched_anime_list_use_case.dart';

import '../../../domain/models/anime.dart';

class SearchedAnimesModel {
  SearchedAnimesModel({
    this.animes = const [],
  });

  List<Anime> animes;
}

class SearchedAnimeListStore
    extends StreamStore<Exception, SearchedAnimesModel> {
  SearchedAnimeListStore({
    required GetSearchedAnimeListUseCase getSearchedAnimeListUseCase,
  })  : _getSearchedAnimeListUseCase = getSearchedAnimeListUseCase,
        super(SearchedAnimesModel());

  final GetSearchedAnimeListUseCase _getSearchedAnimeListUseCase;

  Future<void> getSearchedAnimes(String query) async {
    setLoading(true);
    final animes = await _getSearchedAnimeListUseCase.call(
        params: GetSearchedAnimeListUseCaseParams(query: query));
    animes.when(success: (animes) {
      update(SearchedAnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
