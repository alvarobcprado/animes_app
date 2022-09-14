// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) =>
    AnimeResponse(
      json['id'] as int,
      json['images'] == null
          ? null
          : AnimeImagesResponse.fromJson(
              json['images'] as Map<String, dynamic>),
      json['title'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => AnimeGenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['aired'] == null
          ? null
          : AnimeAiredDateResponse.fromJson(
              json['aired'] as Map<String, dynamic>),
      json['totalEpisodes'] as int?,
    );

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'id': instance.malId,
      'images': instance.images,
      'title': instance.title,
      'genres': instance.genres,
      'aired': instance.aired,
      'totalEpisodes': instance.episodes,
    };
