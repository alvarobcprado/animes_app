// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_aired_date_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsAiredDateResponse _$AnimeDetailsAiredDateResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeDetailsAiredDateResponse(
      json['from'] as String?,
      json['to'] as String?,
    );

Map<String, dynamic> _$AnimeDetailsAiredDateResponseToJson(
        AnimeDetailsAiredDateResponse instance) =>
    <String, dynamic>{
      'from': instance.release,
      'to': instance.end,
    };
