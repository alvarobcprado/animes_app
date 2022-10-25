import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/models/anime.dart';
import '../../../domain/use_cases/get_anime_list_use_case.dart';

class AnimesModel {
  AnimesModel({
    this.animes = const [],
  });

  List<Anime> animes;
}

class AnimeListStore extends StreamStore<Exception, AnimesModel> {
  AnimeListStore({
    required GetAnimeListUseCase getAnimeListUseCase,
  })  : _getAnimeListUseCase = getAnimeListUseCase,
        super(AnimesModel());

  final GetAnimeListUseCase _getAnimeListUseCase;

  Future<void> getAnimeList() async {
    setLoading(true);
    final animes = await _getAnimeListUseCase.call(params: null);
    animes.when(success: (animes) {
      update(AnimesModel(animes: animes));
    }, error: (exception) {
      setError(exception);
    });
    setLoading(false);
  }
}
