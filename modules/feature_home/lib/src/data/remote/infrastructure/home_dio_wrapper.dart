import 'dart:io';

import 'package:core/core.dart';
import 'package:core/dependencies/network.dart';

class HomeDioWrapper<T> {
  Future<Result<T>> call(Future<T> Function() function) async {
    try {
      return Result.success(await function.call());
    } on DioError catch (dioError, _) {
      if (dioError.error is SocketException) {
        return Result.error(NetworkErrorException());
      }
      return Result.error(GenericErrorException());
    }
  }
}
