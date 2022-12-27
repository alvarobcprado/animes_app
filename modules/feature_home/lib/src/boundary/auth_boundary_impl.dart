
import 'package:core/dependencies/routing.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

class AuthBoundaryImpl extends AuthBoundary {
  @override
  void goToFeatureHome(BuildContext context) {
    GoRouter.of(context).pushHome();
  }
}