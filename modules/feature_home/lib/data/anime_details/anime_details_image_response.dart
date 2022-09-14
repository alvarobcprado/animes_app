import 'package:json_annotation/json_annotation.dart';

part 'anime_details_image_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsImageResponse {
  AnimeDetailsImageResponse(this.imageUrl);

  factory AnimeDetailsImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsImageResponseFromJson(json);

  @JsonKey(name: 'url')
  final String? imageUrl;

  Map<String, dynamic> toJson() => _$AnimeDetailsImageResponseToJson(this);
}
