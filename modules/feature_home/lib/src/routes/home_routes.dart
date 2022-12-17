import 'package:core/dependencies/routing.dart';
import 'package:feature_home/src/presentation/anime_details/anime_details_page.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_page.dart';
import 'package:feature_home/src/presentation/favorite_animes/favorite_animes_page.dart';
import 'package:flutter/material.dart';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/home',
          name: RouteNames.home,
          pageBuilder: (context, state) => MaterialPage(
            child: AnimeListPage.create(),
          ),
          routes: [
            GoRoute(
              path: 'details/:id',
              name: RouteNames.details,
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
            GoRoute(
              path: 'favorite',
              name: RouteNames.favorite,
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: FavoriteAnimesPage.create(),
                );
              },
            ),
          ],
        );
}

extension HomeRoutesExtension on BuildContext {
  void goToHome() => goNamed(RouteNames.home);

  void goToDetails(int id) => goNamed(
        RouteNames.details,
        params: {'id': '$id'},
      );

  void goToFavorites() => goNamed(RouteNames.favorite);
}
