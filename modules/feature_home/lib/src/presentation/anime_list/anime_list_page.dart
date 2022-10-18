import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({super.key});

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
                child: FilterSelectChipList(
                  onSelected: (p0, p1) {
                    if (kDebugMode) {
                      print(
                        'Genre ${_animeGenreList[p1]} ${p0 ? 'Selected' : 'Deselected'}',
                      );
                    }
                  },
                  items: _animeGenreList,
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
