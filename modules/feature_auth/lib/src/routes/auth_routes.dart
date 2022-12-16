import 'package:core/dependencies/routing.dart';
import 'package:feature_auth/src/presentation/login_page.dart';
import 'package:flutter/material.dart';

const _loginRoute = 'Login';

class AuthRoutes extends GoRoute {
  AuthRoutes()
      : super(
          path: '/login',
          name: _loginRoute,
          pageBuilder: (context, state) => MaterialPage(
            child: LoginPage.create(),
          ),
          routes: [],
        );
}
