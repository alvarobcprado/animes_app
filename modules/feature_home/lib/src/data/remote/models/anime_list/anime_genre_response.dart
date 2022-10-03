import 'package:core/dependencies/code_gen.dart';

part 'anime_genre_response.g.dart';

@JsonSerializable()
class AnimeGenreResponse {
  AnimeGenreResponse(this.name);

  factory AnimeGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeGenreResponseFromJson(json);

  final String? name;

  Map<String, dynamic> toJson() => _$AnimeGenreResponseToJson(this);
}
