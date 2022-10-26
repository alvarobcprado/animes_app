import 'package:core/dependencies/routing.dart';
import 'package:feature_home/src/presentation/anime_details/anime_details_page.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_page.dart';
import 'package:flutter/material.dart';

const _homeRoute = 'Home';
const _detailsRoute = 'Details';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/home',
          name: _homeRoute,
          pageBuilder: (context, state) => MaterialPage(
            child: AnimeListPage.create(),
          ),
          routes: [
            GoRoute(
              path: 'details/:id',
              name: _detailsRoute,
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: AnimeDetailsPage.create(
                    int.parse(
                      state.params['id'] ?? '0',
                    ),
                  ),
                );
              },
            ),
          ],
        );
}

extension HomeRoutesExtension on GoRouter {
  void pushHome() => pushNamed(_homeRoute);

  void pushDetails(int id) => pushNamed(_detailsRoute, params: {'id': '$id'});
}
