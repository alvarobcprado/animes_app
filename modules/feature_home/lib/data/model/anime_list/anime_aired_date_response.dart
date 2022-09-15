import 'package:json_annotation/json_annotation.dart';

part 'anime_aired_date_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeAiredDateResponse {
  AnimeAiredDateResponse(this.release);

  factory AnimeAiredDateResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeAiredDateResponseFromJson(json);

  @JsonKey(name: 'from')
  final String? release;

  Map<String, dynamic> toJson() => _$AnimeAiredDateResponseToJson(this);
}
