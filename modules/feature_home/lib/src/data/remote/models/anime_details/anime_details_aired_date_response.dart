import 'package:core/dependencies/code_gen.dart';

part 'anime_details_aired_date_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDetailsAiredDateResponse {
  AnimeDetailsAiredDateResponse(
    this.release,
    this.end,
  );

  factory AnimeDetailsAiredDateResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsAiredDateResponseFromJson(json);

  @JsonKey(name: 'from')
  final String? release;
  @JsonKey(name: 'to')
  final String? end;

  Map<String, dynamic> toJson() => _$AnimeDetailsAiredDateResponseToJson(this);
}
