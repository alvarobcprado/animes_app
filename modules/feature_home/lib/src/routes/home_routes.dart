import 'package:core/dependencies/routing.dart';
import 'package:feature_home/src/presentation/anime_details/anime_details_page.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_page.dart';
import 'package:feature_home/src/presentation/favorite_animes/favorite_animes_page.dart';
import 'package:flutter/material.dart';

const _homeRoute = 'Home';
const _detailsRoute = 'Details';
const _favoriteRoute = 'Favorite';

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
            GoRoute(
              path: 'favorite',
              name: _favoriteRoute,
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: FavoriteAnimesPage.create(),
                );
              },
            ),
          ],
        );
}

extension HomeRoutesExtension on GoRouter {
  void pushHome() => pushNamed(_homeRoute);

  void pushDetails(int id) => pushNamed(_detailsRoute, params: {'id': '$id'});

  void pushFavorite(int id) => pushNamed(_favoriteRoute);
}
