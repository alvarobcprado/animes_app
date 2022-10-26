import 'package:core/dependencies/state_management.dart';

import '../../../domain/models/anime.dart';
import '../../../domain/use_cases/get_favorite_animes_use_case.dart';

class FavoriteAnimesModel {
  FavoriteAnimesModel({
    this.animes = const [],
  });

  List<Anime> animes;
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
      update(FavoriteAnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
