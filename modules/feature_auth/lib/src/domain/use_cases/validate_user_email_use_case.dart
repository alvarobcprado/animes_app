import 'package:core/core.dart';

import '../models/input_status.dart';

abstract class ValidateUserEmailUseCase {
  InputStatus call(String? email);
}

class ValidateUserEmailUseCaseImpl implements ValidateUserEmailUseCase {
  @override
  InputStatus call(String? email) {
    if (email == null || email.isEmpty) {
      return InputStatus.empty;
    }
    if (email.isValidEmail()) {
      return InputStatus.valid;
    }
    return InputStatus.invalid;
  }
}
