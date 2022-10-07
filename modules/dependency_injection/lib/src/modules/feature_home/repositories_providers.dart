import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> repositoryProviders() => [
      ProxyProvider2<AnimeRemoteDataSource, AnimeCacheDataSource,
          AnimeRepository>(
        update: (_, remoteDataSource, cacheDataSource, repository) =>
            repository ??
            AnimeRepositoryImpl(
              remoteDataSource: remoteDataSource,
              cacheDataSource: cacheDataSource,
            ),
      ),
    ];
