import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/generated/core_strings.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_auth/src/presentation/auth_controller.dart';
import 'package:feature_auth/src/presentation/stores/stores.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.boundary,
    required this.controller,
  }) : super(key: key);
  final AuthBoundary boundary;
  final AuthController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Widget create() => ProxyProvider<AuthStore, AuthController>(
        update: (_, authStore, controller) =>
            controller ??
            AuthController(
              authStore,
            ),
        child: Consumer2<AuthBoundary, AuthController>(
          builder: (_, boundary, controller, __) =>
              LoginPage(boundary: boundary, controller: controller),
        ),
      );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonPrimary(
        onPressed: () {
          widget.boundary.goToFeatureHome(context);
        },
        isLoading: false,
        buttonText: CoreStrings.of(context)!.enter,
      ),
    );
  }
}
