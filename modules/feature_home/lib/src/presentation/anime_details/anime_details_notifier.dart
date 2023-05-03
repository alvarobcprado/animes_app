import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/src/domain/use_cases/get_anime_details_use_case.dart';
import 'package:feature_home/src/domain/use_cases/toggle_favorite_anime_use_case.dart';
import 'package:feature_home/src/presentation/anime_details/models/anime_details_models.dart';

class AnimeDetailsNotifier extends ReStateActionEvent<AnimeDetailsState,
    AnimeDetailsAction, AnimeDetailsEvent> {
  AnimeDetailsNotifier({
    required GetAnimeDetailsUseCase getAnimeDetailsUseCase,
    required ToggleFavoriteAnimeUseCase toggleFavoriteAnimeUseCase,
    required int animeId,
  })  : _getAnimeDetailsUseCase = getAnimeDetailsUseCase,
        _toggleFavoriteAnimeUseCase = toggleFavoriteAnimeUseCase,
        _animeId = animeId,
        super(const AnimeDetailsInitial()) {
    on<ToggleFavoriteAnime>(_toggleFavoriteAnime);
    on<GetAnimeDetails>(_getAnimeDetails);

    process(const GetAnimeDetails());
  }

  final GetAnimeDetailsUseCase _getAnimeDetailsUseCase;
  final ToggleFavoriteAnimeUseCase _toggleFavoriteAnimeUseCase;
  final int _animeId;

  Future<void> _getAnimeDetails(GetAnimeDetails? event) async {
    emitState(const AnimeDetailsLoading());
    final result = await _getAnimeDetailsUseCase(
      params: GetAnimeDetailsUseCaseParams(id: _animeId),
    );

    result.when(
      success: (animeDetails) {
        emitState(AnimeDetailsLoaded(animeDetails));
      },
      error: (error) {
        emitState(AnimeDetailsError(error));
      },
    );
  }

  Future<void> _toggleFavoriteAnime(ToggleFavoriteAnime event) async {
    final animeDetails = event.animeDetails;
    final result = await _toggleFavoriteAnimeUseCase.call(
        params: ToggleFavoriteAnimeUseCaseParams(animeDetails: animeDetails));

    result.when(
      success: (_) {
        animeDetails.isFavorite = !animeDetails.isFavorite;
        _manageFavoriteToggleAction(animeDetails.isFavorite);
        emitState(AnimeDetailsLoaded(animeDetails));
      },
      error: (exception) {
        emitAction(const ShowFavoriteAnimeErrorSnackBar());
      },
    );
  }

  void _manageFavoriteToggleAction(bool isFavorited) {
    if (isFavorited) {
      emitAction(const ShowFavoriteAnimeSnackBar());
    } else {
      emitAction(const ShowUnfavoriteAnimeSnackBar());
    }
  }
}
