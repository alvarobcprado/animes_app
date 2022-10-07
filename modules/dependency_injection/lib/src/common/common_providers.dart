import 'package:core/dependencies/dependency_injection.dart';
import 'package:dependency_injection/src/common/storage_providers.dart';

List<SingleChildWidget> commonProviders() => [
      ...storageProviders(),
    ];
