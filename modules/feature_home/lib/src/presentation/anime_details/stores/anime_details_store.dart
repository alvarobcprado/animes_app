import 'package:flutter_triple/flutter_triple.dart';

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
  })  : _getAnimeDetailsUseCase = getAnimeDetailsUseCase,
        super(AnimeDetailsModel());

  final GetAnimeDetailsUseCase _getAnimeDetailsUseCase;

  Future<void> getAnimeDetails(int id) async {
    setLoading(true);
    final animeDetails = await _getAnimeDetailsUseCase.call(
        params: GetAnimeDetailsUseCaseParams(id: id));
    animeDetails.when(success: (animeDetails) {
      state.animeDetails = animeDetails;
      update(state);
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}