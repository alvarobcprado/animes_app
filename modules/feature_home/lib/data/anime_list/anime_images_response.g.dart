// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeImagesResponse _$AnimeImagesResponseFromJson(Map<String, dynamic> json) =>
    AnimeImagesResponse(
      json['image'] == null
          ? null
          : AnimeImageResponse.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeImagesResponseToJson(
        AnimeImagesResponse instance) =>
    <String, dynamic>{
      'image': instance.jpg,
    };
