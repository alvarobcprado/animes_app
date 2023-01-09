import 'package:core/dependencies/code_gen.dart';

import '../domain/models/input_status.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required InputStatus emailStatus,
    required InputStatus nameStatus,
    required bool isLoading,
    required bool isValidAuth,
  }) = _AuthModel;

  factory AuthModel.initial() => AuthModel(
        emailStatus: InputStatus.initial,
        nameStatus: InputStatus.initial,
        isLoading: false,
        isValidAuth: false,
      );
}
