// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsDataResponse _$AnimeDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeDetailsDataResponse(
      json['data'] == null
          ? null
          : AnimeDetailsResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDetailsDataResponseToJson(
        AnimeDetailsDataResponse instance) =>
    <String, dynamic>{
      'data': instance.animeDetails,
    };
