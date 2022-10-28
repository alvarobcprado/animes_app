import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/feature_home.dart';

class AnimesModel {
  AnimesModel({
    this.animes = const [],
    this.isLoadingNewPage = false,
  });

  List<Anime> animes;
  bool isLoadingNewPage;
}

class AnimeListStore extends StreamStore<Exception, AnimesModel> {
  AnimeListStore({
    required GetAnimeListUseCase getAnimeListUseCase,
    required GetSearchedAnimeListUseCase getSearchedAnimeListUseCase,
    required GetAnimesByGenreUseCase getAnimesByGenreUseCase,
  })  : _getAnimeListUseCase = getAnimeListUseCase,
        _getSearchedAnimeListUseCase = getSearchedAnimeListUseCase,
        _getAnimesByGenreUseCase = getAnimesByGenreUseCase,
        super(AnimesModel());

  final GetAnimeListUseCase _getAnimeListUseCase;
  final GetSearchedAnimeListUseCase _getSearchedAnimeListUseCase;
  final GetAnimesByGenreUseCase _getAnimesByGenreUseCase;

  List<Anime> animesByPagination = [];
  List<Anime> animesByGenre = [];
  List<Anime> animesBySearch = [];

  Future<void> getAnimeList() async {
    if (state.animes.isEmpty) {
      setLoading(true);
    } else {
      state.isLoadingNewPage = true;
      update(state, force: true);
    }

    final result = await _getAnimeListUseCase.call(params: null);
    result.when(success: (animes) {
      animesByPagination.addAll(animes);
      update(AnimesModel(animes: animesByPagination));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }

  Future<void> getAnimesBySearch(String query) async {
    setLoading(true);
    final result = await _getSearchedAnimeListUseCase.call(
        params: GetSearchedAnimeListUseCaseParams(query: query));
    result.when(success: (animes) {
      animesBySearch.addAll(animes);
      update(AnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }

  Future<void> getAnimesByGenre(String id) async {
    setLoading(true);
    final result = await _getAnimesByGenreUseCase.call(
        params: GetAnimesByGenreUseCaseParams(id: id));
    result.when(success: (animes) {
      animesByGenre.insertAll(0, animes);
      update(AnimesModel(animes: animesByGenre));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
