import 'package:flutter_triple/flutter_triple.dart';

import 'package:core/dependencies/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({
    super.key,
    required this.controller,
  });

  final AnimeListController controller;

  static Widget create() => ProxyProvider3<GenresStore, AnimeListStore,
          SearchedAnimeListStore, AnimeListController>(
        update:
            (_, genresStore, animeListStore, searchedAnimesStore, controller) =>
                controller ??
                AnimeListController(
                  genresStore,
                  animeListStore,
                  searchedAnimesStore,
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
  final String _searchHint = 'Digite o nome do anime que procura';
  final List<String> _animeGenreList = const [
    'Ação',
    'Aventura',
    'Comédia',
    'Drama',
    'Ecchi',
    'Fantasia',
    'Harem',
    'Magia',
    'Mistério',
    'Romance',
    'Sci-Fi',
    'Seinen',
    'Shoujo',
    'Shounen',
    'Slice of Life',
    'Sobrenatural',
    'Super Poderes',
    'Suspense',
    'Terror',
    'Vida Escolar',
  ];

  final List<LabeledCardItem> _animeInfoList = List.generate(
    50,
    (index) => LabeledCardItem(
      imageUrl: 'https://picsum.photos/seed/picsum/300/300',
      labels: [
        LabeledCardText(
          title: 'Título',
          subtitle: 'Anime $index',
        ),
        LabeledCardText(
          title: 'Gênero',
          subtitle: 'Ação, Aventura, Comédia, Fantasia',
        ),
        LabeledCardText(
          title: 'Episódios',
          subtitle: '12',
        ),
        LabeledCardText(
          title: 'Status',
          subtitle: 'Em andamento',
        ),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    widget.controller.genresStore.getGenres();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              PaddingBox.verticalXS(
                child: ScopedBuilder<GenresStore, Exception, GenresModel>(
                  store: widget.controller.genresStore,
                  onLoading: (_) => Text('loading'),
                  onState: (_, state) => FilterSelectChipList(
                    onSelected: (p0, p1) {
                      if (kDebugMode) {
                        print(
                          'Genre ${state.genres![p1]} ${p0 ? 'Selected' : 'Deselected'}',
                        );
                      }
                    },
                    items: state.genres!.map((e) => e.name).toList(),
                  ),
                  onError: (_, error) => Text('error'),
                ),
              ),
              Expanded(
                child: CardList(
                  items: _animeInfoList,
                  onTap: (index) {
                    if (kDebugMode) {
                      print(
                        'Anime ${_animeInfoList[index].labels[0].subtitle} selected',
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}