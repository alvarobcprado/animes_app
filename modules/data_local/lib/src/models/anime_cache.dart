import 'package:hive/hive.dart';

part 'anime_cache.g.dart';

@HiveType(typeId: 0)
class AnimeCache {
  AnimeCache(this.id, this.image, this.title, this.genres, this.release,
      this.totalEpisodes);

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final List<String> genres;
  @HiveField(4)
  final String release;
  @HiveField(5)
  final int totalEpisodes;
}
