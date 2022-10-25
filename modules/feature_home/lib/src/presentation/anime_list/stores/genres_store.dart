import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/models/genre.dart';
import '../../../domain/use_cases/get_anime_genres_use_case.dart';

class GenresModel {
  GenresModel({
    this.genres,
  });

  List<Genre>? genres;
}

class GenresStore extends StreamStore<Exception, GenresModel> {
  GenresStore({
    required GetAnimeGenresUseCase getAnimeGenresUseCase,
  })  : _getAnimeGenresUseCase = getAnimeGenresUseCase,
        super(GenresModel());

  final GetAnimeGenresUseCase _getAnimeGenresUseCase;

  Future<void> getGenres() async {
    setLoading(true);
    final genres = await _getAnimeGenresUseCase.call(params: null);
    genres.when(success: (genres) {
      state.genres = genres;
      update(state);
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}