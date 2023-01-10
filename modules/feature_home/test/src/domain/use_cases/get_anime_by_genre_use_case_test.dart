import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/repositories/anime_repository.dart';
import 'package:feature_home/src/domain/use_cases/get_animes_by_genre_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock animeRepositoryMock;
  late GetAnimesByGenreUseCase getAnimesByGenreUseCase;

  setUp(() {
    animeRepositoryMock = AnimeRepositoryMock();
    getAnimesByGenreUseCase = GetAnimesByGenreUseCase(
      repository: animeRepositoryMock,
    );
  });

  test(
    'given a call when the call is successful then should returns a List<Anime>',
    () async {
      when(() => animeRepositoryMock.getAnimeListByGenre(any(), any()))
          .thenAnswer((_) async => Result.success(mockAnimeList));

      final rawResult = await getAnimesByGenreUseCase.call(
          params: GetAnimesByGenreUseCaseParams(page: 1, id: '1'));

      final result = rawResult.whenOrNull(
        success: (animes) => animes,
      );

      expect(result, equals(mockAnimeList));

      verify(() => animeRepositoryMock.getAnimeListByGenre('1', 1)).called(1);
    },
  );

  test(
    'given a call when the call is fail then should returns an Exception',
    () async {
      final mockException = Exception();

      when(() => animeRepositoryMock.getAnimeListByGenre(any(), any()))
          .thenAnswer((_) async => Result.error(mockException));

      final rawResult = await getAnimesByGenreUseCase.call(
          params: GetAnimesByGenreUseCaseParams(page: 1, id: '1'));

      final result = rawResult.whenOrNull(
        error: (exception) => exception,
      );

      expect(result, equals(mockException));

      verify(() => animeRepositoryMock.getAnimeListByGenre('1', 1)).called(1);
    },
  );
}
