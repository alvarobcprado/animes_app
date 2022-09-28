import 'dart:io';
import 'package:dio/dio.dart';
import 'package:core/model/result.dart';
import 'package:core/model/exceptions.dart';

class DioWrapper<T> {
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
