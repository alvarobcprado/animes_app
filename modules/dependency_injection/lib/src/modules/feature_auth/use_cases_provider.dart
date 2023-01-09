import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_auth/feature_auth.dart';

List<SingleChildWidget> usecaseProviders() => [
      Provider<ValidateUserNameUseCase>(
        create: (_) {
          return ValidateUserNameUseCaseImpl();
        },
      ),
      Provider<ValidateUserEmailUseCase>(
        create: (_) {
          return ValidateUserEmailUseCaseImpl();
        },
      ),
    ];
