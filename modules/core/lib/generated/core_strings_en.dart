import 'core_strings.dart';

/// The translations for English (`en`).
class CoreStringsEn extends CoreStrings {
  CoreStringsEn([String locale = 'en']) : super(locale);

  @override
  String get occurredError => 'An occurred error';

  @override
  String get connectionFail => 'Connection fail';

  @override
  String get tryAgain => 'Try again';

  @override
  String get enter => 'ENTER';
}
