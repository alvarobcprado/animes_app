import 'package:core/dependencies/dependency_injection.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_notifier.dart';
import 'package:feature_home/src/presentation/anime_list/genre_list_notifier.dart';
import 'package:feature_home/src/presentation/anime_list/models/anime_list_models.dart';
import 'package:feature_home/src/presentation/anime_list/models/genre_list_models.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/anime_genres_filter_row.dart';
import 'package:feature_home/src/presentation/anime_list/widgets/paginated_anime_list.dart';
import 'package:flutter/material.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({
    super.key,
    required this.animeListNotifier,
    required this.genreListNotifier,
  });

  final AnimeListNotifier animeListNotifier;
  final GenreListNotifier genreListNotifier;

  static Widget create() => MultiProvider(
        providers: [
          ProxyProvider3<GetAnimeListUseCase, GetAnimesByGenreUseCase,
              GetSearchedAnimeListUseCase, AnimeListNotifier>(
            update: (
              _,
              getAnimeListUseCase,
              getAnimesByGenreUseCase,
              getSearchedAnimeListUseCase,
              animeListNotifier,
            ) =>
                animeListNotifier ??
                AnimeListNotifier(
                  getAnimeListUseCase: getAnimeListUseCase,
                  getAnimesByGenreUseCase: getAnimesByGenreUseCase,
                  getSearchedAnimeListUseCase: getSearchedAnimeListUseCase,
                ),
          ),
          ProxyProvider<GetAnimeGenresUseCase, GenreListNotifier>(
            update: (_, getAnimeGenresUseCase, genreListNotifier) =>
                genreListNotifier ??
                GenreListNotifier(
                  getAnimeGenresUseCase: getAnimeGenresUseCase,
                ),
          ),
        ],
        child: Consumer2<AnimeListNotifier, GenreListNotifier>(
          builder: (_, animeListNotifier, genreListNotifier, __) =>
              AnimeListPage(
            animeListNotifier: animeListNotifier,
            genreListNotifier: genreListNotifier,
          ),
        ),
      );

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  late TextEditingController _searchController;
  late ScrollController _scrollController;
  AnimeListNotifier get _animeListNotifier => widget.animeListNotifier;
  GenreListNotifier get _genreListNotifier => widget.genreListNotifier;
  late String _lastSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _setupScrollController();
    _setupSearchController();
    _genreListNotifier.process(const GetGenres());
    _animeListNotifier.process(const GetAnimes());
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
      _animeListNotifier.process(GetAnimesBySearch(query));
      _lastSearchQuery = query;
    }
  }

  void _setupScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          _animeListNotifier.process(const GetNextAnimeListPage());
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
                AnimeGenresFilterRow(
                  genresNotifier: _genreListNotifier,
                  onGenreSelected: (genreId, isGenreSelected) {
                    _animeListNotifier.process(
                      GetAnimesByGenre(genreId, isGenreSelected),
                    );
                  },
                ),
                PaginatedAnimeList(
                  animeListNotifier: _animeListNotifier,
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
