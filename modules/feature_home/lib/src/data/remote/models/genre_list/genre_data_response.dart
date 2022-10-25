import 'package:core/dependencies/code_gen.dart';

import 'genre_response.dart';

part 'genre_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreDataResponse {
  GenreDataResponse(this.genreList);

  factory GenreDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreDataResponseFromJson(json);

  @JsonKey(name: 'data')
  final List<GenreResponse>? genreList;

  Map<String, dynamic> toJson() => _$GenreDataResponseToJson(this);
}
