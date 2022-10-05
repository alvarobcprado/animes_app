import 'package:core/dependencies/network.dart';
import 'package:feature_home/src/data/remote/infrastructure/home_dio_transformer.dart';
import 'package:flutter/foundation.dart';

class HomeDio extends DioMixin {
  HomeDio() {
    options = BaseOptions(
      baseUrl: 'https://api.jikan.moe/v4',
    );
    httpClientAdapter = DefaultHttpClientAdapter();
    transformer = HomeDioTransformer();
    if (kDebugMode) {
      interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
        ),
      );
    }
  }
}
