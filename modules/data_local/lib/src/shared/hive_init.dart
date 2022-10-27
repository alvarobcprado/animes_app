import 'package:core/dependencies/storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../models/models.dart';

class HiveInit {
  Future<void> execute() async {
    WidgetsFlutterBinding.ensureInitialized();
    Hive
      ..init((await getApplicationDocumentsDirectory()).path)
      ..registerAdapter<AnimeCache>(AnimeCacheAdapter())
      ..registerAdapter<AnimeDetailsCache>(AnimeDetailsCacheAdapter())
      ..registerAdapter<GenreCache>(GenreCacheAdapter());
  }
}
