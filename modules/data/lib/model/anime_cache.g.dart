// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeCacheAdapter extends TypeAdapter<AnimeCache> {
  @override
  final int typeId = 0;

  @override
  AnimeCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeCache(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List).cast<String>(),
      fields[4] as String,
      fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeCache obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.release)
      ..writeByte(5)
      ..write(obj.totalEpisodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
