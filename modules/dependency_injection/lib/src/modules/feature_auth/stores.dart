import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_auth/feature_auth.dart';

List<SingleChildWidget> storesProviders() => [
      ProxyProvider2<ValidateUserEmailUseCase, ValidateUserNameUseCase,
          AuthStore>(
        update: (_, validateUserEmailUseCase, validateUserNameUseCase, store) =>
            store ??
            AuthStore(
                validateUserEmailUseCase: validateUserEmailUseCase,
                validateUserNameUseCase: validateUserNameUseCase),
      ),
    ];
