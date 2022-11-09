import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

extension ErrorExtension on Exception {
  String getErrorMessage(BuildContext context) {
    if (this is NetworkErrorException || this is NullCacheException) {
      return S.of(context).connectionFail;
    }
    return S.of(context).occurredError;
  }
}
