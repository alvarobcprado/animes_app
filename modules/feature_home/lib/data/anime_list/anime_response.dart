import 'package:feature_home/data/anime_list/anime_aired_date_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'anime_genre_response.dart';
import 'anime_images_response.dart';

part 'anime_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeResponse {
  AnimeResponse(this.malId, this.images, this.title, this.genres, this.aired,
      this.episodes);

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  @JsonKey(name: 'id')
  final int malId;
  final AnimeImagesResponse? images;
  final String? title;
  final List<AnimeGenreResponse>? genres;
  final AnimeAiredDateResponse? aired;
  @JsonKey(name: 'totalEpisodes')
  final int? episodes;

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}
