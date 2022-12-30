import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/generated/core_strings.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_auth/generated/auth_strings.dart';
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
  late TextEditingController _userNameController;
  late TextEditingController _userEmailController;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _userEmailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldPrimary(
              controller: _userNameController,
              hintText: AuthStrings.of(context)!.nameHintText,
              errorText: _validateTypedName(InputStatus.invalid),
              keyboardType: TextInputType.name,
            ),
            TextFieldPrimary(
              controller: _userEmailController,
              hintText: AuthStrings.of(context)!.emailHintText,
              errorText: _validateTypedEmail(InputStatus.invalid),
              keyboardType: TextInputType.name,
            ),
            ButtonPrimary(
              onPressed: () {
                widget.boundary.goToFeatureHome(context);
              },
              isLoading: false,
              buttonText: CoreStrings.of(context)!.enter,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateTypedName(InputStatus status) {
    switch (status) {
      case InputStatus.empty:
        return AuthStrings.of(context)!.emptyField;
      case InputStatus.invalid:
        return AuthStrings.of(context)!.nameInvalid;
      default:
        return null;
    }
  }

  String? _validateTypedEmail(InputStatus status) {
    switch (status) {
      case InputStatus.empty:
        return AuthStrings.of(context)!.emptyField;
      case InputStatus.invalid:
        return AuthStrings.of(context)!.emailInvalid;
      default:
        return null;
    }
  }
}
