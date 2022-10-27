import 'package:core/dependencies/code_gen.dart';

import 'anime_aired_date_response.dart';
import 'anime_genre_response.dart';
import 'anime_images_response.dart';

part 'anime_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeResponse {
  AnimeResponse(
    this.id,
    this.images,
    this.title,
    this.genres,
    this.aired,
    this.totalEpisodes,
  );

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  @JsonKey(name: 'mal_id')
  final int? id;
  final AnimeImagesResponse? images;
  final String? title;
  final List<AnimeGenreResponse>? genres;
  final AnimeAiredDateResponse? aired;
  @JsonKey(name: 'episodes')
  final int? totalEpisodes;

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}
