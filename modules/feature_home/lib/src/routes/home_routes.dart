import 'package:core/dependencies/routing.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_page.dart';
import 'package:flutter/material.dart';

const _homeRoute = 'Home';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: '/home',
          name: _homeRoute,
          pageBuilder: (context, state) => MaterialPage(
            child: AnimeListPage.create(),
          ),
          routes: [],
        );
}

extension HomeRoutesExtension on GoRouter {}
