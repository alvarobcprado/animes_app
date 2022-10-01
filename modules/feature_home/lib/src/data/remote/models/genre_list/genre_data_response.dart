import 'package:core/dependencies/code_gen.dart';

import 'genre_response.dart';

part 'genre_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreDataResponse {
  GenreDataResponse(this.data);

  factory GenreDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreDataResponseFromJson(json);

  @JsonKey(name: 'genreList')
  final List<GenreResponse>? data;

  Map<String, dynamic> toJson() => _$GenreDataResponseToJson(this);
}
