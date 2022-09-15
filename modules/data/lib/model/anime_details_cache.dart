import 'package:hive/hive.dart';

part 'anime_details_cache.g.dart';

@HiveType(typeId: 1)
class AnimeDetailsCache {
  AnimeDetailsCache(this.id, this.title, this.titleEnglish, this.image,
      this.release, this.end, this.synopsis, this.score);

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String titleEnglish;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String release;
  @HiveField(5)
  final String end;
  @HiveField(6)
  final String synopsis;
  @HiveField(7)
  final double score;
}
