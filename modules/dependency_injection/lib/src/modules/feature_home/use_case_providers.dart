import 'package:core/dependencies/dependency_injection.dart';
import 'package:feature_home/feature_home.dart';

List<SingleChildWidget> usecaseProviders() => [
      ProxyProvider<AnimeRepository, GetAnimeDetailsUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetAnimeDetailsUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, GetAnimeGenresUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetAnimeGenresUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, GetAnimeListUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetAnimeListUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, GetSearchedAnimeListUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetSearchedAnimeListUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, ToggleFavoriteAnimeUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            ToggleFavoriteAnimeUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, GetFavoriteAnimesUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetFavoriteAnimesUseCase(
              repository: repository,
            ),
      ),
      ProxyProvider<AnimeRepository, GetAnimesByGenreUseCase>(
        update: (_, repository, usecase) =>
            usecase ??
            GetAnimesByGenreUseCase(
              repository: repository,
            ),
      ),
    ];
