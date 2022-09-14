// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsResponse _$AnimeDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeDetailsResponse(
      json['id'] as int,
      json['title'] as String?,
      json['title_english'] as String?,
      json['images'] == null
          ? null
          : AnimeDetailsImagesResponse.fromJson(
              json['images'] as Map<String, dynamic>),
      json['aired'] == null
          ? null
          : AnimeDetailsAiredDateResponse.fromJson(
              json['aired'] as Map<String, dynamic>),
      json['synopsis'] as String?,
      (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AnimeDetailsResponseToJson(
        AnimeDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.malId,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'images': instance.images,
      'aired': instance.aired,
      'synopsis': instance.synopsis,
      'score': instance.score,
    };
