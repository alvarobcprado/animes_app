import 'package:json_annotation/json_annotation.dart';

part 'anime_details_aired_date_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsAiredDateResponse {
  AnimeDetailsAiredDateResponse(this.from, this.to);

  factory AnimeDetailsAiredDateResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsAiredDateResponseFromJson(json);

  @JsonKey(name: 'release')
  final String? from;
  @JsonKey(name: 'end')
  final String? to;

  Map<String, dynamic> toJson() => _$AnimeDetailsAiredDateResponseToJson(this);
}
