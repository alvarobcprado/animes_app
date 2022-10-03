import 'package:core/dependencies/routing.dart';
import 'package:flutter/material.dart';

/// /home
const _homeRoute = 'Home';

/// /home/sub
const _homeSubRoute = 'HomeSubPage';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/home',
          name: _homeRoute,
          pageBuilder: (context, state) => MaterialPage(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Home'),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: () => GoRouter.of(context).goToHomeSubPage(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          routes: [
            GoRoute(
              path: 'sub',
              name: _homeSubRoute,
              pageBuilder: (context, state) => MaterialPage(
                child: Builder(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Home Sub'),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => GoRouter.of(context).pop(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
}

extension HomeRoutesExtension on GoRouter {
  void goToHomeSubPage() {
    goNamed(_homeSubRoute);
  }
}
