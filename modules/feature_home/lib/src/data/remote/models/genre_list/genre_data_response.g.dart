// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreDataResponse _$GenreDataResponseFromJson(Map<String, dynamic> json) =>
    GenreDataResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => GenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenreDataResponseToJson(GenreDataResponse instance) =>
    <String, dynamic>{
      'data': instance.genreList,
    };
