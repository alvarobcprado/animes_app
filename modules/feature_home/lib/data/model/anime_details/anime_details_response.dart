import 'package:json_annotation/json_annotation.dart';
import 'anime_details_aired_date_response.dart';
import 'anime_details_images_response.dart';

part 'anime_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsResponse {
  AnimeDetailsResponse(this.id, this.title, this.titleEnglish, this.images,
      this.aired, this.synopsis, this.score);

  factory AnimeDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsResponseFromJson(json);

  @JsonKey(name: 'malId')
  final int? id;
  final String? title;
  final String? titleEnglish;
  final AnimeDetailsImagesResponse? images;
  final AnimeDetailsAiredDateResponse? aired;
  final String? synopsis;
  final double? score;

  Map<String, dynamic> toJson() => _$AnimeDetailsResponseToJson(this);
}
