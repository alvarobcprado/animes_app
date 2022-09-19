// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_details_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeDetailsCacheAdapter extends TypeAdapter<AnimeDetailsCache> {
  @override
  final int typeId = 1;

  @override
  AnimeDetailsCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeDetailsCache(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeDetailsCache obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.titleEnglish)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.release)
      ..writeByte(5)
      ..write(obj.end)
      ..writeByte(6)
      ..write(obj.synopsis)
      ..writeByte(7)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeDetailsCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
