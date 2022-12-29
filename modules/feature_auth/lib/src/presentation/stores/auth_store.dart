import 'package:core/dependencies/state_management.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_auth/src/domain/models/user.dart';
import 'package:feature_auth/src/domain/use_cases/validate_user_email_use_case.dart';
import 'package:feature_auth/src/domain/use_cases/validate_user_name_use_case.dart';

class AuthModel {
  final InputStatus emailStatus;
  final InputStatus nameStatus;

  AuthModel({required this.emailStatus, required this.nameStatus});

  factory AuthModel.initial() => AuthModel(
        emailStatus: InputStatus.initial,
        nameStatus: InputStatus.initial,
      );
}

class AuthStore extends StreamStore<Exception, AuthModel> {
  AuthStore(
      {required ValidateUserEmailUseCase validateUserEmailUseCase,
      required ValidateUserNameUseCase validateUserNameUseCase})
      : _validateUserEmailUseCase = validateUserEmailUseCase,
        _validateUserNameUseCase = validateUserNameUseCase,
        super(AuthModel.initial());

  final ValidateUserEmailUseCase _validateUserEmailUseCase;
  final ValidateUserNameUseCase _validateUserNameUseCase;

  void doLogin(User user) {
    final isValidName = _validateUserNameUseCase(user.name);
    final isValidEmail = _validateUserEmailUseCase(user.email);
    update(AuthModel(emailStatus: isValidEmail, nameStatus: isValidName));
  }
}
