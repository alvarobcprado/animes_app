import 'core_strings.dart';

/// The translations for Portuguese (`pt`).
class CoreStringsPt extends CoreStrings {
  CoreStringsPt([String locale = 'pt']) : super(locale);

  @override
  String get occurredError => 'Ocorreu um erro';

  @override
  String get connectionFail => 'Falha na conexão';
}
