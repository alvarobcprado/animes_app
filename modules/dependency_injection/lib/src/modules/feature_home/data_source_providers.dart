import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> remoteDataSourceProviders() => [
      ProxyProvider2<HomeDio, HomeDioWrapper, AnimeRemoteDataSource>(
        update: (_, dio, wrapper, dataSource) =>
            dataSource ??
            AnimeRemoteDataSourceImpl(
              dio: dio,
              wrapper: wrapper,
            ),
      ),
    ];
