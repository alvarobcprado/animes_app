import 'package:json_annotation/json_annotation.dart';

part 'anime_url_response.g.dart';

@JsonSerializable()
class AnimeUrlResponse {
  AnimeUrlResponse(this.next);

  factory AnimeUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeUrlResponseFromJson(json);

  final String? next;

  Map<String, dynamic> toJson() => _$AnimeUrlResponseToJson(this);
}
