import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> networkProviders() => [
      Provider<HomeDioWrapper>(
        create: (_) => HomeDioWrapper(),
      ),
      Provider<HomeDio>(
        create: (_) => HomeDio(),
      ),
    ];
