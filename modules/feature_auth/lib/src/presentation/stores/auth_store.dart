import 'package:core/dependencies/state_management.dart';
import 'package:feature_auth/src/domain/models/user.dart';
import 'package:feature_auth/src/domain/use_cases/validate_user_email_use_case.dart';
import 'package:feature_auth/src/domain/use_cases/validate_user_name_use_case.dart';

class AuthModel {}

class AuthStore extends StreamStore<Exception, AuthModel> {
  AuthStore(
      {required ValidateUserEmailUseCase validateUserEmailUseCase,
      required ValidateUserNameUseCase validateUserNameUseCase})
      : _validateUserEmailUseCase = validateUserEmailUseCase,
        _validateUserNameUseCase = validateUserNameUseCase,
        super(AuthModel());

  final ValidateUserEmailUseCase _validateUserEmailUseCase;
  final ValidateUserNameUseCase _validateUserNameUseCase;

  void doLogin(User user) {}
}
