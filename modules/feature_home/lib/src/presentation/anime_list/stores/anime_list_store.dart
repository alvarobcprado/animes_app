import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';

class AnimeListStore extends StreamStore<Exception, AnimesModel> {
  AnimeListStore({
    required GetAnimeListUseCase getAnimeListUseCase,
    required GetSearchedAnimeListUseCase getSearchedAnimeListUseCase,
    required GetAnimesByGenreUseCase getAnimesByGenreUseCase,
  })  : _getAnimeListUseCase = getAnimeListUseCase,
        _getSearchedAnimeListUseCase = getSearchedAnimeListUseCase,
        _getAnimesByGenreUseCase = getAnimesByGenreUseCase,
        super(AnimesModel.initial());

  final GetAnimeListUseCase _getAnimeListUseCase;
  final GetSearchedAnimeListUseCase _getSearchedAnimeListUseCase;
  final GetAnimesByGenreUseCase _getAnimesByGenreUseCase;

  final List<Anime> _animesByPagination = [];
  final List<Anime> _animesByGenre = [];
  final List<Anime> _animesBySearch = [];
  final Set<String> _genresFilter = {};
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 500));

  Future<void> getAnimeList() async {
    if (state.animes.isEmpty) {
      setLoading(true);
    } else {
      update(state.copyWith(isLoadingNewPage: true));
    }

    final result = await _getAnimeListUseCase.call(params: null);

    result.when(
      success: (animes) {
        _animesByPagination.addAll(animes);
        update(
          state.copyWith(animes: _animesByPagination, isLoadingNewPage: false),
        );
      },
      error: (exception) {
        setError(exception);
      },
    );

    setLoading(false);
  }

  Future<void> getAnimesBySearch(String query) async {
    setLoading(true);

    if (query.isEmpty) {
      update(AnimesModel(animes: _animesByPagination));
      setLoading(false);
      return;
    }

    final result = await _getSearchedAnimeListUseCase.call(
      params: GetSearchedAnimeListUseCaseParams(query: query),
    );

    result.when(
      success: (animes) {
        _animesBySearch.addAll(animes);
        update(state.copyWith(animes: _animesBySearch));
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

    if (_genresFilter.isEmpty) {
      update(state.copyWith(animes: _animesByPagination));
      setLoading(false);
      _debouncer.dispose();
      return;
    }

    _debouncer(
      () async {
        final composedGenres = _genresFilter.join(',');

        final result = await _getAnimesByGenreUseCase.call(
          params: GetAnimesByGenreUseCaseParams(id: composedGenres),
        );

        result.when(
          success: (animes) {
            _animesByGenre.addAll(animes);
            update(state.copyWith(animes: _animesByGenre));
          },
          error: (exception) {
            setError(exception);
          },
        );

        setLoading(false);
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
