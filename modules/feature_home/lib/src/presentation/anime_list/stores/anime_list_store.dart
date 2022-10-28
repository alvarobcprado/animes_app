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

  List<Anime> animeList = [];

  Future<void> getAnimeList() async {
    if (state.animes.isEmpty) {
      setLoading(true);
    } else {
      state.isLoadingNewPage = true;
      update(state, force: true);
    }

    final result = await _getAnimeListUseCase.call(params: null);
    result.when(success: (animes) {
      animeList.addAll(animes);
      update(AnimesModel(animes: animeList));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }

  Future<void> getAnimesBySearch(String query) async {
    setLoading(true);
    final animes = await _getSearchedAnimeListUseCase.call(
        params: GetSearchedAnimeListUseCaseParams(query: query));
    animes.when(success: (animes) {
      update(AnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }

  Future<void> getAnimesByGenre() async {
    setLoading(true);
    final animes = await _getAnimesByGenreUseCase.call(params: null);
    animes.when(success: (animes) {
      update(AnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
