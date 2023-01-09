import 'auth_strings.dart';

/// The translations for Portuguese (`pt`).
class AuthStringsPt extends AuthStrings {
  AuthStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get nameHintText => 'Nome';

  @override
  String get emailHintText => 'Email';

  @override
  String get emptyField => 'Preencha o campo';

  @override
  String get nameInvalid => 'Digite um nome válido';

  @override
  String get emailInvalid => 'Digite um email válido';
}
