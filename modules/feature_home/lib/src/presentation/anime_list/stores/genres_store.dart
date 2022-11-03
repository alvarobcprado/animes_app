import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';

import '../../../domain/use_cases/get_anime_genres_use_case.dart';

class GenresStore extends StreamStore<Exception, GenresModel> {
  GenresStore({
    required GetAnimeGenresUseCase getAnimeGenresUseCase,
  })  : _getAnimeGenresUseCase = getAnimeGenresUseCase,
        super(GenresModel.initial());

  final GetAnimeGenresUseCase _getAnimeGenresUseCase;

  Future<void> getGenres() async {
    setLoading(true);
    final genres = await _getAnimeGenresUseCase.call(params: null);
    genres.when(success: (genres) {
      update(state.copyWith(genres: genres));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
