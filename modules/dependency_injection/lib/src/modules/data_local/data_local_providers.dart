import 'package:core/dependencies/dependency_injection.dart';
import 'package:dependency_injection/src/modules/data_local/cache_data_source_providers.dart';

List<SingleChildWidget> dataLocalProviders() =>
    [...cacheDataSourceProviders()];
