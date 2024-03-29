import 'package:core/core.dart';
import 'package:core/dependencies/routing.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_auth/generated/auth_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await GeneralConfigs.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: '/login',
    routes: [
      AuthRoutes(),
      HomeRoutes(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GeneralProvider(
      child: MaterialApp.router(
        title: 'Animes App',
        theme: lightAppThemeData,
        darkTheme: darkAppThemeData,
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
        localizationsDelegates: const [
          CoreStrings.delegate,
          AuthStrings.delegate,
          HomeStrings.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          ...CoreStrings.supportedLocales,
          ...AuthStrings.supportedLocales,
          ...HomeStrings.supportedLocales,
        ],
      ),
    );
  }
}
