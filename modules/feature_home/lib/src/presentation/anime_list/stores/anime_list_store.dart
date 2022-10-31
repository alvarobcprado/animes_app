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

  final List<Anime> _animesByPagination = [];
  final List<Anime> _animesByGenre = [];
  final List<Anime> _animesBySearch = [];
  final List<String> _genresFilter = [];

  Future<void> getAnimeList() async {
    if (state.animes.isEmpty) {
      setLoading(true);
    } else {
      state.isLoadingNewPage = true;
      update(state, force: true);
    }

    final result = await _getAnimeListUseCase.call(params: null);

    result.when(
      success: (animes) {
        _animesByPagination.addAll(animes);
        update(AnimesModel(animes: _animesByPagination));
      },
      error: (exception) {
        setError(exception);
      },
    );

    setLoading(false);
  }

  Future<void> getAnimesBySearch(String query) async {
    setLoading(true);

    final result = await _getSearchedAnimeListUseCase.call(
      params: GetSearchedAnimeListUseCaseParams(query: query),
    );

    result.when(
      success: (animes) {
        _animesBySearch.addAll(animes);
        update(AnimesModel(animes: animes));
      },
      error: (exception) {
        setError(exception);
      },
    );

    setLoading(false);
  }

  Future<void> getAnimesByGenre(String id, bool isAddingGenre) async {
    setLoading(true);
    _updateGenresFilter(id, isAddingGenre);

    execute(
      delay: const Duration(milliseconds: 500),
      () async {
        if (_genresFilter.isEmpty) {
          return AnimesModel(animes: _animesByPagination);
        }

        final composedGenres = _genresFilter.join(',');

        final result = await _getAnimesByGenreUseCase.call(
          params: GetAnimesByGenreUseCaseParams(id: composedGenres),
        );

        return result.when(
          success: (animes) {
            _animesByGenre.addAll(animes);
            return AnimesModel(animes: _animesByGenre);
          },
          error: (exception) {
            throw exception;
          },
        );
      },
    );
  }

  void _updateGenresFilter(String id, bool isAddingGenre) {
    final genresLength = _genresFilter.length;
    if (isAddingGenre) {
      _genresFilter.add(id);
    } else {
      _genresFilter.remove(id);
    }

    if (genresLength != _genresFilter.length) {
      _animesByGenre.clear();
    }
  }
}
