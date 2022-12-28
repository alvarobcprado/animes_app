import 'package:core/core.dart';
import 'package:feature_auth/src/domain/models/email_status.dart';

abstract class ValidateUserEmailUseCase {
  EmailStatus call(String? email);
}

class ValidateUserEmailUseCaseImpl implements ValidateUserEmailUseCase {
  @override
  EmailStatus call(String? email) {
    if (email == null || email.isEmpty) {
      return EmailStatus.empty;
    }
    if (email.isValidEmail()) {
      return EmailStatus.valid;
    }
    return EmailStatus.invalid;
  }
}
