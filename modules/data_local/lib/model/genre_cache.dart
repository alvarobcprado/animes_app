import 'package:hive/hive.dart';

part 'genre_cache.g.dart';

@HiveType(typeId: 2)
class GenreCache {
  GenreCache(this.name);

  @HiveField(0)
  final String name;
}
