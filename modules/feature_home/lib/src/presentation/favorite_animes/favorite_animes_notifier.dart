import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/src/domain/use_cases/use_cases.dart';
import 'package:feature_home/src/presentation/favorite_animes/models/favorite_animes_models.dart';

class FavoriteAnimesNotifier
    extends ReStateEvent<FavoriteAnimesState, FavoriteAnimesEvent> {
  FavoriteAnimesNotifier({
    required GetFavoriteAnimesUseCase getFavoriteAnimesUseCase,
  })  : _getFavoriteAnimesUseCase = getFavoriteAnimesUseCase,
        super(const FavoriteAnimesInitial()) {
    on<GetFavoriteAnimes>(_getFavoriteAnimes);
  }

  final GetFavoriteAnimesUseCase _getFavoriteAnimesUseCase;

  Future<void> _getFavoriteAnimes(GetFavoriteAnimes event) async {
    emitState(const FavoriteAnimesLoading());
    final animes = await _getFavoriteAnimesUseCase.call(params: null);
    animes.when(success: (animes) {
      emitState(FavoriteAnimesLoaded(animeList: animes));
    }, error: (exception) {
      emitState(FavoriteAnimesError(exception));
    });
  }
}
