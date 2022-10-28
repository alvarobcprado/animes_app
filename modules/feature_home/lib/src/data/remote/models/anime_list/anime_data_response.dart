import 'package:core/dependencies/code_gen.dart';

import 'anime_pagination_response.dart';
import 'anime_response.dart';

part 'anime_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AnimeDataResponse {
  AnimeDataResponse(this.animes, this.pagination);

  factory AnimeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataResponseFromJson(json);

  @JsonKey(name: 'data')
  final List<AnimeResponse>? animes;
  @JsonKey(name: 'pagination')
  final AnimePaginationResponse? pagination;

  Map<String, dynamic> toJson() => _$AnimeDataResponseToJson(this);
}
