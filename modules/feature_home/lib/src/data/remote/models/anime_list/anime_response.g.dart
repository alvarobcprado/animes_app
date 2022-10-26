// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) =>
    AnimeResponse(
      json['mal_id'] as int?,
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
      json['episodes'] as int?,
    );

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'images': instance.images,
      'title': instance.title,
      'genres': instance.genres,
      'aired': instance.aired,
      'episodes': instance.totalEpisodes,
    };
