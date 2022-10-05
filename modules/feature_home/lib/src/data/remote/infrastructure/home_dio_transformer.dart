import 'dart:convert';

import 'package:core/dependencies/network.dart';
import 'package:flutter/foundation.dart';

class HomeDioTransformer extends DefaultTransformer {
  HomeDioTransformer()
      : super(
          jsonDecodeCallback: (rawData) => compute(jsonDecode, rawData),
        );
}
