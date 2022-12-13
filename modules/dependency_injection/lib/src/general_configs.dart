import 'package:data_local/data_local.dart';
import 'package:flutter/material.dart';

abstract class GeneralConfigs {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveInit.execute();
  }
}
