import 'package:core/dependencies/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_controller.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/anime_genres_filter_row.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/paginated_anime_list.dart';

import 'package:flutter/material.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({
    super.key,
    required this.controller,
  });

  final AnimeListController controller;

  static Widget create() =>
      ProxyProvider2<GenresStore, AnimeListStore, AnimeListController>(
        update: (_, genresStore, animeListStore, controller) =>
            controller ??
            AnimeListController(
              genresStore,
              animeListStore,
            ),
        child: Consumer<AnimeListController>(
          builder: (_, controller, __) => AnimeListPage(controller: controller),
        ),
      );

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  late TextEditingController _searchController;
  late ScrollController _scrollController;
  AnimeListController get _pageController => widget.controller;
  late String _lastSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _setupScrollController();
    _setupSearchController();
    _pageController.genresStore.getGenres();
    _pageController.animeListStore.getAnimeList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _setupSearchController() {
    _searchController = TextEditingController();
  }

  void _onSearchChanged(String query) {
    if (query != _lastSearchQuery) {
      _pageController.animeListStore.getAnimesBySearch(query);
      _lastSearchQuery = query;
    }
  }

  void _setupScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _pageController.getMoreAnimes();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: PaddingBox.ltrbFactor(
            topFactor: 2,
            leftFactor: 2,
            rightFactor: 2,
            child: Column(
              children: [
                AppSearchBar(
                  controller: _searchController,
                  hintText: HomeStrings.of(context)!.animeListPageSearchHint,
                  onChanged: _onSearchChanged,
                ),
                AnimeGenresFilterRow(pageController: _pageController),
                PaginatedAnimeList(
                  pageController: _pageController,
                  scrollController: _scrollController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
