import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/repositories/anime_repository.dart';
import 'package:feature_home/src/domain/use_cases/get_searched_anime_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock animeRepositoryMock;
  late GetSearchedAnimeListUseCase getSearchedAnimeListUseCase;

  setUp(() {
    animeRepositoryMock = AnimeRepositoryMock();
    getSearchedAnimeListUseCase = GetSearchedAnimeListUseCase(
      repository: animeRepositoryMock,
    );
  });

  test(
    'given a call when the call is successful then should returns a List<Anime>',
    () async {
      when(() => animeRepositoryMock.getAnimeListBySearch(any(), any()))
          .thenAnswer((_) async => Result.success(mockAnimeList));

      final rawResult = await getSearchedAnimeListUseCase.call(
          params: GetSearchedAnimeListUseCaseParams(query: 'query', page: 1));

      final result = rawResult.whenOrNull(
        success: (animes) => animes,
      );

      expect(result, equals(mockAnimeList));

      verify(() => animeRepositoryMock.getAnimeListBySearch('query', 1))
          .called(1);
    },
  );

  test(
    'given a call when the call is fail then should returns an Exception',
    () async {
      final mockException = Exception();

      when(() => animeRepositoryMock.getAnimeListBySearch(any(), any()))
          .thenAnswer((_) async => Result.error(mockException));

      final rawResult = await getSearchedAnimeListUseCase.call(
          params: GetSearchedAnimeListUseCaseParams(query: 'query', page: 1));

      final result = rawResult.whenOrNull(
        error: (exception) => exception,
      );

      expect(result, equals(mockException));

      verify(() => animeRepositoryMock.getAnimeListBySearch('query', 1))
          .called(1);
    },
  );
}
