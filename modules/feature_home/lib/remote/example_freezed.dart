import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_freezed.freezed.dart';

typedef WrapperCallback<T> = Future<T> Function();

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = _Success;
  const factory Result.error(Exception error) = _Error;
}

final a = Result.success(A(test: 'test'));
final b = Result.error(Exception('error'));

class A {
  String test;
  A({
    required this.test,
  });
}

class DioWrapper {
  Future<Result<T>> call<T>(WrapperCallback<T> function) async {
    try {
      return Result.success(await function.call());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

Future<A> test() async {
  return A(test: 'test');
}

void main() {
  final wrapper = DioWrapper();
  final result = wrapper(test);
  result.then(
    (value) => value.when(
      success: (data) {},
      error: (error) => {},
    ),
  );
}
