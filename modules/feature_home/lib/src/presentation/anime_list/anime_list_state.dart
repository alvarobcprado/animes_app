import 'package:core/dependencies/code_gen.dart';
import 'package:feature_home/src/domain/models/models.dart';

part 'anime_list_state.freezed.dart';

@freezed
class AnimesModel with _$AnimesModel {
  factory AnimesModel({
    required List<Anime> animes,
    @Default(false) bool isLoadingNewPage,
    @Default(false) bool hasPaginationError,
  }) = _AnimesModel;

  factory AnimesModel.initial() => AnimesModel(animes: []);
}

@freezed
class GenresModel with _$GenresModel {
  factory GenresModel({required List<Genre> genres}) = _GenresModel;

  factory GenresModel.initial() => GenresModel(genres: []);
}
