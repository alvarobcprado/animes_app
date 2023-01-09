import 'auth_strings.dart';

/// The translations for English (`en`).
class AuthStringsEn extends AuthStrings {
  AuthStringsEn([String locale = 'en']) : super(locale);

  @override
  String get nameHintText => 'Name';

  @override
  String get emailHintText => 'Email';

  @override
  String get emptyField => 'Field cannot be empty';

  @override
  String get nameInvalid => 'Enter a valid name';

  @override
  String get emailInvalid => 'Enter a valid email';
}
