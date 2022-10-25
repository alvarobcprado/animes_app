import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'anime_details_controller.dart';

class AnimeDetailsPage extends StatefulWidget {
  const AnimeDetailsPage({
    super.key,
    required this.controller,
  });

  final AnimeDetailsController controller;

  static Widget create() => ProxyProvider2<AnimeDetailsStore,
          ToggleFavoriteAnimeStore, AnimeDetailsController>(
        update: (_, animeDetailsStore, toggleFavoriteAnimeStore, controller) =>
            controller ??
            AnimeDetailsController(
              animeDetailsStore,
              toggleFavoriteAnimeStore,
            ),
        child: Consumer<AnimeDetailsController>(
          builder: (_, controller, __) =>
              AnimeDetailsPage(controller: controller),
        ),
      );

  @override
  State<AnimeDetailsPage> createState() => _AnimeDetailsPageState();
}

class _AnimeDetailsPageState extends State<AnimeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
