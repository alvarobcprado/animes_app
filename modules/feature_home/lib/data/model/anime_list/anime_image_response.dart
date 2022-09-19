import 'package:json_annotation/json_annotation.dart';

part 'anime_image_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeImageResponse {
  AnimeImageResponse(this.url);

  factory AnimeImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageResponseFromJson(json);

  @JsonKey(name: 'imageUrl')
  final String? url;

  Map<String, dynamic> toJson() => _$AnimeImageResponseToJson(this);
}
