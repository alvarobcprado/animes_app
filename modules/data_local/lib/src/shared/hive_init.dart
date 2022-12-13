import 'package:core/dependencies/storage.dart';

import '../models/models.dart';

abstract class HiveInit {
  static Future<void> execute() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter<AnimeCache>(AnimeCacheAdapter())
      ..registerAdapter<AnimeDetailsCache>(AnimeDetailsCacheAdapter())
      ..registerAdapter<GenreCache>(GenreCacheAdapter());
  }
}
