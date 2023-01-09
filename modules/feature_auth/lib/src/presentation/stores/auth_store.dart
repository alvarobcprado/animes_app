import 'package:core/core.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_auth/src/presentation/auth_state.dart';

class AuthStore extends StreamStore<Exception, AuthModel> {
  AuthStore(
      {required ValidateUserEmailUseCase validateUserEmailUseCase,
      required ValidateUserNameUseCase validateUserNameUseCase})
      : _validateUserEmailUseCase = validateUserEmailUseCase,
        _validateUserNameUseCase = validateUserNameUseCase,
        super(AuthModel.initial());

  final ValidateUserEmailUseCase _validateUserEmailUseCase;
  final ValidateUserNameUseCase _validateUserNameUseCase;
  final Debouncer _debouncer = Debouncer(const Duration(milliseconds: 2000));

  void doLogin(User user) {
    update(
      state.copyWith(
        isLoading: true,
      ),
    );
    _debouncer(() {
      final isValidName = _validateUserNameUseCase(user.name);
      final isValidEmail = _validateUserEmailUseCase(user.email);
      update(
        AuthModel(
          emailStatus: isValidEmail,
          nameStatus: isValidName,
          isLoading: false,
          isValidAuth: isValidEmail == InputStatus.valid &&
              isValidName == InputStatus.valid,
        ),
      );
    });
  }
}
