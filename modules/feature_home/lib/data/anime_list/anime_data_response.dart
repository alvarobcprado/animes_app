import 'package:feature_home/data/anime_list/anime_url_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'anime_response.dart';

part 'anime_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDataResponse {
  AnimeDataResponse(this.data, this.links);

  factory AnimeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataResponseFromJson(json);

  @JsonKey(name: 'animes')
  final List<AnimeResponse>? data;
  @JsonKey(name: 'url')
  final AnimeUrlResponse? links;

  Map<String, dynamic> toJson() => _$AnimeDataResponseToJson(this);
}
