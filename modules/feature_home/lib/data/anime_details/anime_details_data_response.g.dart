// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsDataResponse _$AnimeDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeDetailsDataResponse(
      json['animeDetails'] == null
          ? null
          : AnimeDetailsResponse.fromJson(
              json['animeDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDetailsDataResponseToJson(
        AnimeDetailsDataResponse instance) =>
    <String, dynamic>{
      'animeDetails': instance.data,
    };
