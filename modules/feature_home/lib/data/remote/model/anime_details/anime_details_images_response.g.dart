// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailsImagesResponse _$AnimeDetailsImagesResponseFromJson(
        Map<String, dynamic> json) =>
    AnimeDetailsImagesResponse(
      json['webp'] == null
          ? null
          : AnimeDetailsImageResponse.fromJson(
              json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDetailsImagesResponseToJson(
        AnimeDetailsImagesResponse instance) =>
    <String, dynamic>{
      'webp': instance.image,
    };
