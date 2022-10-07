import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/storage.dart';

List<SingleChildWidget> storageProviders() => [
      Provider<HiveInterface>(
        create: (_) {
          return Hive;
        },
      )
    ];
