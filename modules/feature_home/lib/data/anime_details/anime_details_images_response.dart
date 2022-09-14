import 'package:json_annotation/json_annotation.dart';
import 'anime_details_image_response.dart';

part 'anime_details_images_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsImagesResponse {
  AnimeDetailsImagesResponse(this.webp);

  factory AnimeDetailsImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsImagesResponseFromJson(json);

  @JsonKey(name: 'image')
  final AnimeDetailsImageResponse? webp;

  Map<String, dynamic> toJson() => _$AnimeDetailsImagesResponseToJson(this);
}
