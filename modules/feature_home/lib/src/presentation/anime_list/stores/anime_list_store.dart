import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';

enum AnimePaginationSource {
  byGenre,
  bySearch,
  list,
}

// ignore: must_be_immutable
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

  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 500));
  final List<Anime> _animes = [];
  final List<Anime> _animesByGenre = [];
  final List<Anime> _animesBySearch = [];
  final Set<String> _genresFilter = {};
  String _searchQuery = '';
  AnimePaginationSource _paginationSource = AnimePaginationSource.list;

  int _animesListPage = 1;
  int _animesByGenrePage = 1;
  int _animesBySearchPage = 1;

  Future<void> getAnimeList() async {
    final hasAnimeToGet = _setAnimeLoading(_animes);

    if (!hasAnimeToGet) {
      return;
    }

    final result = await _getAnimeListUseCase.call(
      params: GetAnimeListUseCaseParams(
        page: _animesListPage,
      ),
    );

    result.when(
      success: (animes) {
        _paginationSource = AnimePaginationSource.list;
        _animes.addAll(animes);
        if (_hasNextPage(_animes)) {
          _animesListPage++;
        }
        update(
          state.copyWith(animes: _animes, isLoadingNewPage: false),
        );
      },
      error: (exception) {
        setError(exception);
      },
    );

    setLoading(false);
  }

  Future<void> getAnimesBySearch(String query) async {
    _updateSearchQuery(query);

    final hasAnimeToGet = _setAnimeLoading(_animesBySearch);

    if (!hasAnimeToGet) {
      return;
    }

    if (query.isEmpty) {
      update(AnimesModel(animes: _animes));
      setLoading(false);
      _paginationSource = AnimePaginationSource.list;
      _debouncer.dispose();
      _searchQuery = '';
      return;
    }

    _debouncer(
      () async {
        final result = await _getSearchedAnimeListUseCase.call(
          params: GetSearchedAnimeListUseCaseParams(
            query: _searchQuery,
            page: _animesBySearchPage,
          ),
        );
        result.when(
          success: (animes) {
            _paginationSource = AnimePaginationSource.bySearch;
            _animesBySearch.addAll(animes);
            if (_hasNextPage(_animesBySearch)) {
              _animesBySearchPage++;
            }
            update(state.copyWith(
              animes: _animesBySearch,
              isLoadingNewPage: false,
            ));
          },
          error: (exception) {
            setError(exception);
          },
        );

        setLoading(false);
      },
    );
  }

  Future<void> getAnimesByGenre(String id, bool isAddingGenre) async {
    _updateGenresFilter(id, isAddingGenre);

    final hasAnimeToGet = _setAnimeLoading(_animesByGenre);

    if (!hasAnimeToGet) {
      return;
    }

    if (_genresFilter.isEmpty) {
      update(
        state.copyWith(animes: _animes, isLoadingNewPage: false),
      );
      setLoading(false);
      _paginationSource = AnimePaginationSource.list;
      _debouncer.dispose();
      return;
    }

    _debouncer(
      () async {
        final composedGenres = _genresFilter.join(',');

        final result = await _getAnimesByGenreUseCase.call(
          params: GetAnimesByGenreUseCaseParams(
            id: composedGenres,
            page: _animesByGenrePage,
          ),
        );

        result.when(
          success: (animes) {
            _paginationSource = AnimePaginationSource.byGenre;
            _animesByGenre.addAll(animes);
            if (_hasNextPage(_animesByGenre)) {
              _animesByGenrePage++;
            }
            update(
              state.copyWith(animes: _animesByGenre, isLoadingNewPage: false),
            );
          },
          error: (exception) {
            setError(exception);
          },
        );

        setLoading(false);
      },
    );
  }

  Future<void> getMoreAnimes() async {
    switch (_paginationSource) {
      case AnimePaginationSource.list:
        await getAnimeList();
        break;
      case AnimePaginationSource.byGenre:
        await getAnimesByGenre('', false);
        break;
      case AnimePaginationSource.bySearch:
        await getAnimesBySearch(_searchQuery);
        break;
    }
  }

  void _updateGenresFilter(String id, bool isAddingGenre) {
    final hasGenresChanged =
        isAddingGenre ? _genresFilter.add(id) : _genresFilter.remove(id);

    if (hasGenresChanged) {
      _animesByGenrePage = 1;
      _animesByGenre.clear();
    }
  }

  void _updateSearchQuery(String query) {
    if (query != _searchQuery) {
      _searchQuery = query;
      _animesBySearch.clear();
      _animesBySearchPage = 1;
    }
  }

  bool _hasNextPage(List animeList) => animeList.length % 25 == 0;

  bool _setAnimeLoading(List<Anime> animeList) {
    if (animeList.isEmpty) {
      setLoading(true);
    } else if (_hasNextPage(animeList)) {
      update(state.copyWith(isLoadingNewPage: true));
    } else {
      //TODO: add last page reached
      return false;
    }
    return true;
  }
}
