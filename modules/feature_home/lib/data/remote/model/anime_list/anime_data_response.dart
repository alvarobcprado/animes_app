import 'package:json_annotation/json_annotation.dart';
import 'anime_response.dart';
import 'anime_url_response.dart';

part 'anime_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDataResponse {
  AnimeDataResponse(this.animes, this.url);

  factory AnimeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataResponseFromJson(json);

  @JsonKey(name: 'data')
  final List<AnimeResponse>? animes;
  @JsonKey(name: 'links')
  final AnimeUrlResponse? url;

  Map<String, dynamic> toJson() => _$AnimeDataResponseToJson(this);
}
