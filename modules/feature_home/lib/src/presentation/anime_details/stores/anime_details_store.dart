import 'package:core/dependencies/state_management.dart';
import 'package:feature_home/feature_home.dart';

import '../../../domain/models/anime_details.dart';
import '../../../domain/use_cases/get_anime_details_use_case.dart';

class AnimeDetailsModel {
  AnimeDetailsModel({
    this.animeDetails,
  });

  AnimeDetails? animeDetails;
}

class AnimeDetailsStore extends StreamStore<Exception, AnimeDetailsModel> {
  AnimeDetailsStore({
    required GetAnimeDetailsUseCase getAnimeDetailsUseCase,
    required ToggleFavoriteAnimeUseCase toggleFavoriteAnimeUseCase,
  })  : _getAnimeDetailsUseCase = getAnimeDetailsUseCase,
        _toggleFavoriteAnimeUseCase = toggleFavoriteAnimeUseCase,
        super(AnimeDetailsModel());

  final GetAnimeDetailsUseCase _getAnimeDetailsUseCase;
  final ToggleFavoriteAnimeUseCase _toggleFavoriteAnimeUseCase;

  Future<void> getAnimeDetails(int id) async {
    setLoading(true);

    final result = await _getAnimeDetailsUseCase(
      params: GetAnimeDetailsUseCaseParams(id: id),
    );

    result.when(
      success: (animeDetails) {
        update(AnimeDetailsModel(animeDetails: animeDetails));
      },
      error: (error) {
        setError(error);
      },
    );

    setLoading(false);
  }

  Future<void> toggleFavoriteAnime(AnimeDetails animeDetails) async {
    final result = await _toggleFavoriteAnimeUseCase.call(
        params: ToggleFavoriteAnimeUseCaseParams(animeDetails: animeDetails));

    result.when(
      success: (_) {
        animeDetails.isFavorite = !animeDetails.isFavorite;
        update(AnimeDetailsModel(animeDetails: animeDetails));
      },
      error: (exception) {
        //setError(exception);
      },
    );
  }
}
