import 'package:core/core.dart';
import 'package:feature_auth/src/domain/models/name_status.dart';

abstract class ValidateUserNameUseCase {
  NameStatus call(String? name);
}

class ValidateUserNameUseCaseImpl implements ValidateUserNameUseCase {
  @override
  NameStatus call(String? name) {
    if (name == null || name.isEmpty) {
      return NameStatus.empty;
    }
    if (name.isValidName()) {
      return NameStatus.valid;
    }
    return NameStatus.invalid;
  }
}
