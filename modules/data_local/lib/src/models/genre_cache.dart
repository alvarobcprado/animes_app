import 'package:core/dependencies/storage.dart';

part 'genre_cache.g.dart';

@HiveType(typeId: 2)
class GenreCache {
  GenreCache(this.name);

  @HiveField(0)
  final String name;
}
