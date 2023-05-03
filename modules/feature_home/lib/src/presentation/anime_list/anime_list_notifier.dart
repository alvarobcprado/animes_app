import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_list/models/anime_list_models.dart';

enum AnimePaginationSource {
  byGenre,
  bySearch,
  list,
}

// ignore: must_be_immutable
class AnimeListNotifier extends ReStateEvent<AnimeListModel, AnimeListEvent> {
  AnimeListNotifier({
    required GetAnimeListUseCase getAnimeListUseCase,
    required GetSearchedAnimeListUseCase getSearchedAnimeListUseCase,
    required GetAnimesByGenreUseCase getAnimesByGenreUseCase,
  })  : _getAnimeListUseCase = getAnimeListUseCase,
        _getSearchedAnimeListUseCase = getSearchedAnimeListUseCase,
        _getAnimesByGenreUseCase = getAnimesByGenreUseCase,
        super(AnimeListModel.initial()) {
    on<GetAnimes>(_getAnimeList);
    on<GetAnimesByGenre>(_getAnimesByGenre);
    on<GetAnimesBySearch>(_getAnimesBySearch);
    on<GetNextAnimeListPage>(_getNextAnimeListPage);
  }

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

  Future<void> _getAnimeList(GetAnimes event) async {
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

        emitState(
          state.copyWith(
            animes: _animes,
            isLoadingNewPage: false,
            hasPaginationError: false,
            error: null,
          ),
        );
      },
      error: (exception) {
        if (exception is PaginationErrorException) {
          emitState(
            state.copyWith(
              hasPaginationError: true,
              isLoadingNewPage: false,
              error: null,
            ),
          );
        } else {
          emitState(AnimeListModel.error(exception));
        }
      },
    );
  }

  Future<void> _getAnimesBySearch(GetAnimesBySearch event) async {
    final query = event.searchQuery;
    _updateSearchQuery(query);

    final hasAnimeToGet = _setAnimeLoading(_animesBySearch);

    if (!hasAnimeToGet) {
      return;
    }

    if (query.isEmpty) {
      emitState(AnimeListModel(animes: _animes));
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
            emitState(
              state.copyWith(
                animes: _animesBySearch,
                isLoadingNewPage: false,
                hasPaginationError: false,
                error: null,
              ),
            );
          },
          error: (exception) {
            if (exception is PaginationErrorException) {
              emitState(state.copyWith(
                hasPaginationError: true,
                error: null,
              ));
            } else {
              emitState(AnimeListModel.error(exception));
            }
          },
        );
      },
    );
  }

  Future<void> _getAnimesByGenre(GetAnimesByGenre event) async {
    _updateGenresFilter(event.genreId, event.isAddingGenre);

    final hasAnimeToGet = _setAnimeLoading(_animesByGenre);

    if (!hasAnimeToGet) {
      return;
    }

    if (_genresFilter.isEmpty) {
      emitState(
        state.copyWith(
          animes: _animes,
          isLoadingNewPage: false,
          hasPaginationError: false,
          error: null,
        ),
      );
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
            emitState(
              state.copyWith(
                animes: _animesByGenre,
                isLoadingNewPage: false,
                hasPaginationError: false,
                error: null,
              ),
            );
          },
          error: (exception) {
            if (exception is PaginationErrorException) {
              emitState(state.copyWith(
                hasPaginationError: true,
                error: null,
              ));
            } else {
              emitState(AnimeListModel.error(exception));
            }
          },
        );
      },
    );
  }

  Future<void> _getNextAnimeListPage(GetNextAnimeListPage event) async {
    switch (_paginationSource) {
      case AnimePaginationSource.list:
        process(const GetAnimes());
        break;
      case AnimePaginationSource.byGenre:
        process(GetAnimesByGenre(_genresFilter.first, true));
        break;
      case AnimePaginationSource.bySearch:
        process(GetAnimesBySearch(_searchQuery));
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
      emitState(AnimeListModel.loading());
    } else if (_hasNextPage(animeList)) {
      emitState(
        state.copyWith(
          isLoadingNewPage: true,
          hasPaginationError: false,
          error: null,
        ),
      );
    } else {
      //TODO: add last page reached
      return false;
    }
    return true;
  }
}
