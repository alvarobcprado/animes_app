import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/storage.dart';
import 'package:data_local/data_local.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> cacheDataSourceProviders() => [
      ProxyProvider<HiveInterface, AnimeCacheDataSource>(
        update: (_, hive, dataSource) =>
            dataSource ??
            AnimeCacheDataSourceImpl(
              hive: hive,
            ),
      ),
    ];
