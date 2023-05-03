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
    ];
