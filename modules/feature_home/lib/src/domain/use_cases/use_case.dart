import 'package:core/core.dart';

abstract class UseCase<Input, Output> {
  Future<Result<Output>> call({required Input params});
}
