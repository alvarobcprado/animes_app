// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GenreCacheAdapter extends TypeAdapter<GenreCache> {
  @override
  final int typeId = 2;

  @override
  GenreCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GenreCache(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GenreCache obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenreCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
