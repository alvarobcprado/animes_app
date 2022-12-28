import 'package:core/dependencies/dependency_injection.dart';
import 'package:dependency_injection/src/modules/feature_auth/stores.dart';
import 'package:dependency_injection/src/modules/feature_auth/use_cases_provider.dart';

List<SingleChildWidget> featureAuthProviders() => [
      ...usecaseProviders(),
      ...storesProviders(),
    ];
