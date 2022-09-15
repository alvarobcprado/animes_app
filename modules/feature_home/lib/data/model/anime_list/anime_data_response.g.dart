// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDataResponse _$AnimeDataResponseFromJson(Map<String, dynamic> json) =>
    AnimeDataResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => AnimeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['links'] == null
          ? null
          : AnimeUrlResponse.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDataResponseToJson(AnimeDataResponse instance) =>
    <String, dynamic>{
      'data': instance.animes,
      'links': instance.url,
    };
