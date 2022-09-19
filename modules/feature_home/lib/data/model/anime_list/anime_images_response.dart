import 'package:json_annotation/json_annotation.dart';
import 'anime_image_response.dart';

part 'anime_images_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeImagesResponse {
  AnimeImagesResponse(this.image);

  factory AnimeImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeImagesResponseFromJson(json);

  @JsonKey(name: 'jpg')
  final AnimeImageResponse? image;

  Map<String, dynamic> toJson() => _$AnimeImagesResponseToJson(this);
}
