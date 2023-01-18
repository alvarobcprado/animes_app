import 'package:feature_auth/src/domain/models/user.dart';
import 'package:feature_auth/src/presentation/stores/auth_store.dart';

class AuthController {
  AuthController(this.authStore);

  final AuthStore authStore;

  void doLogin(User user) {
    authStore.doLogin(user);
  }
}
