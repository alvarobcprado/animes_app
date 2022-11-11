import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> storesProviders() => [
      ProxyProvider<GetAnimeGenresUseCase, GenresStore>(
        update: (_, usecase, store) =>
            store ??
            GenresStore(
              getAnimeGenresUseCase: usecase,
            ),
      ),
      ProxyProvider3<GetAnimeListUseCase, GetSearchedAnimeListUseCase,
          GetAnimesByGenreUseCase, AnimeListStore>(
        update: (_, getAnimeListUseCase, getSearchedAnimeListUseCase,
                getAnimeByGenreUseCase, store) =>
            store ??
            AnimeListStore(
              getAnimeListUseCase: getAnimeListUseCase,
              getSearchedAnimeListUseCase: getSearchedAnimeListUseCase,
              getAnimesByGenreUseCase: getAnimeByGenreUseCase,
            ),
      ),
      ProxyProvider2<GetAnimeDetailsUseCase, ToggleFavoriteAnimeUseCase,
          AnimeDetailsStore>(
        update:
            (_, getAnimeDetailsUseCase, togglefavoriteAnimeUseCase, store) =>
                store ??
                AnimeDetailsStore(
                  getAnimeDetailsUseCase: getAnimeDetailsUseCase,
                  toggleFavoriteAnimeUseCase: togglefavoriteAnimeUseCase,
                ),
      ),
      ProxyProvider<GetFavoriteAnimesUseCase, FavoriteAnimesStore>(
        update: (_, usecase, store) =>
            store ??
            FavoriteAnimesStore(
              getFavoriteAnimesUseCase: usecase,
            ),
      ),
    ];
