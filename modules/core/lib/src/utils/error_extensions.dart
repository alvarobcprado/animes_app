import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

extension ErrorExtension on Exception {
  String getErrorMessage(BuildContext context) {
    if (this is NetworkErrorException || this is NullCacheException) {
      return CoreStrings.of(context)!.occurredError;
    }
    return CoreStrings.of(context)!.occurredError;
  }
}
