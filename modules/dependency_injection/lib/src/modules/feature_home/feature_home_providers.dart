import 'package:core/dependencies/dependency_injection.dart';
import 'package:dependency_injection/src/modules/feature_home/data_source_providers.dart';
import 'package:dependency_injection/src/modules/feature_home/network_provider.dart';
import 'package:dependency_injection/src/modules/feature_home/repositories_providers.dart';
import 'package:dependency_injection/src/modules/feature_home/use_case_providers.dart';

List<SingleChildWidget> featureHomeProviders() => [
      ...networkProviders(),
      ...dataSourceProviders(),
      ...repositoryProviders(),
      ...usecaseProviders(),
    ];
