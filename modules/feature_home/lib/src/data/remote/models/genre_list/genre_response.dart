import 'package:core/dependencies/code_gen.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  GenreResponse(this.name, this.id);

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  final String? name;
  @JsonKey(name: 'mal_id')
  final int? id;

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
