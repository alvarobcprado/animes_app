import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';
import 'package:navigation/navigation.dart';

List<SingleChildWidget> boundaryProviders() => [
  Provider<AuthBoundary>(
    create: (_) {
      return AuthBoundaryImpl();
    },
  )
];
