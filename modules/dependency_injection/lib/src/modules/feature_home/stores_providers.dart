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
      ProxyProvider<GetAnimeListUseCase, AnimeListStore>(
        update: (_, usecase, store) =>
            store ??
            AnimeListStore(
              getAnimeListUseCase: usecase,
            ),
      ),
      ProxyProvider<GetSearchedAnimeListUseCase, SearchedAnimeListStore>(
        update: (_, usecase, store) =>
            store ??
            SearchedAnimeListStore(
              getSearchedAnimeListUseCase: usecase,
            ),
      ),
      ProxyProvider<GetAnimeDetailsUseCase, AnimeDetailsStore>(
        update: (_, usecase, store) =>
            store ??
            AnimeDetailsStore(
              getAnimeDetailsUseCase: usecase,
            ),
      ),
      ProxyProvider<ToggleFavoriteAnimeUseCase, ToggleFavoriteAnimeStore>(
        update: (_, usecase, store) =>
            store ??
            ToggleFavoriteAnimeStore(
              toggleFavoriteAnimeUseCase: usecase,
            ),
      ),
    ];