import 'package:core/core.dart';
import 'package:feature_auth/src/domain/models/input_status.dart';

abstract class ValidateUserNameUseCase {
  InputStatus call(String? name);
}

class ValidateUserNameUseCaseImpl implements ValidateUserNameUseCase {
  @override
  InputStatus call(String? name) {
    if (name == null || name.isEmpty) {
      return InputStatus.empty;
    }
    if (name.isValidName()) {
      return InputStatus.valid;
    }
    return InputStatus.invalid;
  }
}
