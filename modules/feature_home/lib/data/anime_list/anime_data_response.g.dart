// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDataResponse _$AnimeDataResponseFromJson(Map<String, dynamic> json) =>
    AnimeDataResponse(
      (json['animes'] as List<dynamic>?)
          ?.map((e) => AnimeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['url'] == null
          ? null
          : AnimeUrlResponse.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDataResponseToJson(AnimeDataResponse instance) =>
    <String, dynamic>{
      'animes': instance.data,
      'url': instance.links,
    };
