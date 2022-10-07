import 'package:core/src/commons/result.dart';

abstract class UseCase<Input, Output> {
  Future<Result<Output>> call({required Input params});
}
