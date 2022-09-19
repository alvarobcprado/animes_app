import 'package:json_annotation/json_annotation.dart';

part 'anime_details_image_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsImageResponse {
  AnimeDetailsImageResponse(this.url);

  factory AnimeDetailsImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsImageResponseFromJson(json);

  @JsonKey(name: 'imageUrl')
  final String? url;

  Map<String, dynamic> toJson() => _$AnimeDetailsImageResponseToJson(this);
}
