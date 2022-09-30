import 'package:json_annotation/json_annotation.dart';
import 'anime_details_response.dart';

part 'anime_details_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsDataResponse {
  AnimeDetailsDataResponse(this.animeDetails);

  factory AnimeDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsDataResponseFromJson(json);

  @JsonKey(name: 'data')
  final AnimeDetailsResponse? animeDetails;

  Map<String, dynamic> toJson() => _$AnimeDetailsDataResponseToJson(this);
}
