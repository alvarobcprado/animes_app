// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeImagesResponse _$AnimeImagesResponseFromJson(Map<String, dynamic> json) =>
    AnimeImagesResponse(
      json['jpg'] == null
          ? null
          : AnimeImageResponse.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeImagesResponseToJson(
        AnimeImagesResponse instance) =>
    <String, dynamic>{
      'jpg': instance.image,
    };
