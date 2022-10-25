import 'package:core/dependencies/code_gen.dart';

part 'anime_image_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeImageResponse {
  AnimeImageResponse(this.url);

  factory AnimeImageResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageResponseFromJson(json);

  @JsonKey(name: 'image_url')
  final String? url;

  Map<String, dynamic> toJson() => _$AnimeImageResponseToJson(this);
}
