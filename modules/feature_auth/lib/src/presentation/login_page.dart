import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_auth/generated/auth_strings.dart';
import 'package:feature_auth/src/presentation/auth_controller.dart';
import 'package:feature_auth/src/presentation/auth_state.dart';
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

  AuthController get _pageController => widget.controller;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _userEmailController = TextEditingController();
    _setObserverForAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const SizedBox(height: 140),
              Image.asset(
                Images.logo,
                width: 220,
                height: 220,
              ),
              const SizedBox(height: 40),
              TripleBuilder(
                  store: _pageController.authStore,
                  builder: (context, triple) {
                    final nameStatus = (triple.state as AuthModel).nameStatus;
                    return TextFieldPrimary(
                      controller: _userNameController,
                      hintText: AuthStrings.of(context)!.nameHintText,
                      errorText: _validateTypedName(nameStatus),
                      keyboardType: TextInputType.name,
                    );
                  }),
              const SizedBox(height: 20),
              TripleBuilder(
                  store: _pageController.authStore,
                  builder: (context, triple) {
                    final emailStatus = (triple.state as AuthModel).emailStatus;
                    return TextFieldPrimary(
                      controller: _userEmailController,
                      hintText: AuthStrings.of(context)!.emailHintText,
                      errorText: _validateTypedEmail(emailStatus),
                      keyboardType: TextInputType.name,
                    );
                  }),
              const SizedBox(height: 40),
              TripleBuilder(
                  store: _pageController.authStore,
                  builder: (context, triple) {
                    final isLoading = (triple.state as AuthModel).isLoading;
                    return ButtonPrimary(
                      onPressed: () {
                        _pageController.doLogin(
                          User(
                            _userNameController.text,
                            _userEmailController.text,
                          ),
                        );
                      },
                      isLoading: isLoading,
                      buttonText: CoreStrings.of(context)!.enter,
                    );
                  }),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void _setObserverForAuthentication() {
    _pageController.authStore.observer(
        onError: (_) {},
        onLoading: (_) {},
        onState: (state) {
          if (state.isValidAuth) {
            widget.boundary.goToFeatureHome(context);
          }
        });
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
