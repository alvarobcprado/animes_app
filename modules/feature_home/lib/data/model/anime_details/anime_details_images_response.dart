import 'package:json_annotation/json_annotation.dart';
import 'anime_details_image_response.dart';

part 'anime_details_images_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsImagesResponse {
  AnimeDetailsImagesResponse(this.image);

  factory AnimeDetailsImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsImagesResponseFromJson(json);

  @JsonKey(name: 'webp')
  final AnimeDetailsImageResponse? image;

  Map<String, dynamic> toJson() => _$AnimeDetailsImagesResponseToJson(this);
}
