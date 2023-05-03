import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/src/domain/use_cases/use_cases.dart';
import 'package:feature_home/src/presentation/anime_list/models/genre_list_models.dart';

class GenreListNotifier extends ReStateEvent<GenreListState, GenreListEvent> {
  GenreListNotifier({
    required GetAnimeGenresUseCase getAnimeGenresUseCase,
  })  : _getAnimeGenresUseCase = getAnimeGenresUseCase,
        super(const GenreListLoading()) {
    on<GetGenres>(_getGenres);
  }

  final GetAnimeGenresUseCase _getAnimeGenresUseCase;

  Future<void> _getGenres(GetGenres event) async {
    emitState(const GenreListLoading());
    final genres = await _getAnimeGenresUseCase.call(params: null);
    genres.when(success: (genres) {
      emitState(GenreListLoaded(genreList: genres));
    }, error: (exception) {
      emitState(GenreListError(error: exception));
    });
  }
}
