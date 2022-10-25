import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/src/presentation/favorite_animes/stores/stores.dart';
import 'package:flutter/material.dart';

import 'favorite_animes_controller.dart';

class FavoriteAnimesPage extends StatefulWidget {
  const FavoriteAnimesPage({
    super.key,
    required this.controller,
  });

  final FavoriteAnimesController controller;

  static Widget create() =>
      ProxyProvider<FavoriteAnimesStore, FavoriteAnimesController>(
        update: (_, favoriteAnimesStore, controller) =>
            controller ??
            FavoriteAnimesController(
              favoriteAnimesStore,
            ),
        child: Consumer<FavoriteAnimesController>(
          builder: (_, controller, __) =>
              FavoriteAnimesPage(controller: controller),
        ),
      );

  @override
  State<FavoriteAnimesPage> createState() => _FavoriteAnimesPageState();
}

class _FavoriteAnimesPageState extends State<FavoriteAnimesPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
