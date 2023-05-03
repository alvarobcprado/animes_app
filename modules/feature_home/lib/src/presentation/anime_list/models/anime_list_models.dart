import 'package:core/dependencies/code_gen.dart';
import 'package:feature_home/src/domain/models/models.dart';

part 'anime_list_models.freezed.dart';

@freezed
class AnimeListModel with _$AnimeListModel {
  factory AnimeListModel({
    required List<Anime> animes,
    @Default(false) bool isLoadingNewPage,
    @Default(false) bool hasPaginationError,
    Exception? error,
  }) = _AnimeListModel;

  factory AnimeListModel.initial() => AnimeListModel(animes: []);
  factory AnimeListModel.loading() => AnimeListModel(animes: []);
  factory AnimeListModel.error(Exception error) =>
      AnimeListModel(animes: [], error: error);
}

abstract class AnimeListEvent {
  const AnimeListEvent();
}

class GetAnimes extends AnimeListEvent {
  const GetAnimes();
}

class GetAnimesByGenre extends AnimeListEvent {
  const GetAnimesByGenre(this.genreId, this.isAddingGenre);
  final String genreId;
  final bool isAddingGenre;
}

class GetAnimesBySearch extends AnimeListEvent {
  const GetAnimesBySearch(this.searchQuery);
  final String searchQuery;
}

class GetNextAnimeListPage extends AnimeListEvent {
  const GetNextAnimeListPage();
}
