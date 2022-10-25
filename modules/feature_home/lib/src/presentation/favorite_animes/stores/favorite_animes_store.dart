import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/models/anime.dart';
import '../../../domain/use_cases/get_favorite_animes_use_case.dart';

class FavoriteAnimesModel {
  FavoriteAnimesModel({
    this.animes,
  });

  List<Anime>? animes;
}

class FavoriteAnimesStore extends StreamStore<Exception, FavoriteAnimesModel> {
  FavoriteAnimesStore({
    required GetFavoriteAnimesUseCase getFavoriteAnimesUseCase,
  })  : _getFavoriteAnimesUseCase = getFavoriteAnimesUseCase,
        super(FavoriteAnimesModel());

  final GetFavoriteAnimesUseCase _getFavoriteAnimesUseCase;

  Future<void> getFavoriteAnimes() async {
    setLoading(true);
    final animes = await _getFavoriteAnimesUseCase.call(params: null);
    animes.when(success: (animes) {
      state.animes = animes;
      update(state);
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
