import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_controller.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_state.dart';
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
  late AnimeListController _pageController;
  late String _lastSearchQuery = '';
  final String _searchHint = 'Digite o nome do anime que procura';

  @override
  void initState() {
    super.initState();
    _setupScrollController();
    _setupSearchController();
    _pageController = widget.controller;
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
    final colors = Theme.of(context).extension<AppColorsFoundation>();
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
                  hintText: _searchHint,
                  onChanged: _onSearchChanged,
                ),
                PaddingBox.verticalXS(
                  child: ScopedBuilder<GenresStore, Exception, GenresModel>(
                    store: _pageController.genresStore,
                    onLoading: (_) => const SizedBox(),
                    onState: (_, state) {
                      final genreList = state.genres;
                      return genreList.isNotEmpty
                          ? FilterSelectChipList(
                              onSelected: (isSelected, index) {
                                _pageController.getAnimesByGenre(
                                  genreList[index].id.toString(),
                                  isSelected,
                                );
                              },
                              items: genreList.map((e) => e.name).toList(),
                            )
                          : const SizedBox();
                    },
                    onError: (_, error) => const SizedBox(),
                  ),
                ),
                Expanded(
                  child: ScopedBuilder<AnimeListStore, Exception, AnimesModel>(
                    store: _pageController.animeListStore,
                    onLoading: (_) => Center(
                      child: CircularProgressIndicator(
                        color: colors!.primary,
                      ),
                    ),
                    onState: (_, state) {
                      final animeList = state.animes;
                      return animeList.isNotEmpty
                          ? Stack(
                              children: [
                                Column(
                                  children: [
                                    Expanded(
                                      child: CardList(
                                        scrollController: _scrollController,
                                        items: animeList
                                            .map(
                                              (e) => LabeledCardItem(
                                                imageUrl: e.image,
                                                labels: [
                                                  LabeledCardText(
                                                    title: 'Título:',
                                                    subtitle: e.title,
                                                  ),
                                                  LabeledCardText(
                                                    title: 'Gênero:',
                                                    subtitle: e
                                                            .genres.isNotEmpty
                                                        ? e.genres.join(", ")
                                                        : '-',
                                                  ),
                                                  LabeledCardText(
                                                    title: 'Episódios:',
                                                    subtitle:
                                                        e.totalEpisodes == -1
                                                            ? 'Em breve'
                                                            : e.totalEpisodes
                                                                .toString(),
                                                  ),
                                                  LabeledCardText(
                                                    title:
                                                        'Data de lançamento:',
                                                    subtitle: e
                                                            .release.isNotEmpty
                                                        ? e.release
                                                            .convertDateToBrLocale()
                                                        : 'Em breve',
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                        onTap: (index) {},
                                      ),
                                    ),
                                  ],
                                ),
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  bottom: state.isLoadingNewPage ? 48 : 0,
                                  left: 0,
                                  right: 0,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: state.isLoadingNewPage ? 1 : 0,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: colors?.surface,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                colors!.onSurface.withOpacity(
                                              0.5,
                                            ),
                                            blurRadius: 2,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: PaddingBox.allFactor(
                                        factor: 0.5,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: CircularProgressIndicator(
                                            color: colors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 16,
                                  right: 0,
                                  child: Column(
                                    children: [
                                      IconButton(
                                        color: colors.onPrimary,
                                        style: IconButton.styleFrom(
                                          backgroundColor: colors.primary,
                                          padding: const EdgeInsets.all(12),
                                        ),
                                        onPressed: () {
                                          _scrollController.jumpTo(
                                            0,
                                          );
                                        },
                                        icon: const Icon(Icons.arrow_upward),
                                      ),
                                      SpacerBox.verticalXS(),
                                      IconButton(
                                        color: colors.onPrimary,
                                        style: IconButton.styleFrom(
                                          backgroundColor: colors.primary,
                                          padding: const EdgeInsets.all(12),
                                        ),
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const Text('lista vazia');
                    },
                    onError: (_, error) => Column(
                      children: [
                        const Text('error'),
                        TextButton(
                          onPressed: () {
                            _pageController.animeListStore.getAnimeList();
                          },
                          child: const Text('tentar novamente'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
