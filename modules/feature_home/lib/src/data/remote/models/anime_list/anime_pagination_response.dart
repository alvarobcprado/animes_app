import 'package:core/dependencies/code_gen.dart';

part 'anime_pagination_response.g.dart';

@JsonSerializable()
class AnimePaginationResponse {
  AnimePaginationResponse(this.hasNextPage);

  factory AnimePaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimePaginationResponseFromJson(json);

  @JsonKey(name: 'has_next_page')
  final bool? hasNextPage;

  Map<String, dynamic> toJson() => _$AnimePaginationResponseToJson(this);
}
