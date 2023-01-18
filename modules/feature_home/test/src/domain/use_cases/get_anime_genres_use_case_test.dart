import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/repositories/anime_repository.dart';
import 'package:feature_home/src/domain/use_cases/get_anime_genres_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock animeRepositoryMock;
  late GetAnimeGenresUseCase getAnimeGenresUseCase;

  setUp(() {
    animeRepositoryMock = AnimeRepositoryMock();
    getAnimeGenresUseCase = GetAnimeGenresUseCase(
      repository: animeRepositoryMock,
    );
  });

  test(
    'given a call when the call is successful then should returns a List<Genre>',
    () async {
      when(() => animeRepositoryMock.getAnimeGenres())
          .thenAnswer((_) async => Result.success(mockAnimeGenreList));

      final rawResult = await getAnimeGenresUseCase.call(params: null);

      final result = rawResult.whenOrNull(
        success: (animeGenreList) => animeGenreList,
      );

      expect(result, equals(mockAnimeGenreList));

      verify(() => animeRepositoryMock.getAnimeGenres()).called(1);
    },
  );

  test(
    'given a call when the call is fail then should returns an Exception',
    () async {
      final mockException = Exception();

      when(() => animeRepositoryMock.getAnimeGenres())
          .thenAnswer((_) async => Result.error(mockException));

      final rawResult = await getAnimeGenresUseCase.call(params: null);

      final result = rawResult.whenOrNull(
        error: (exception) => exception,
      );

      expect(result, equals(mockException));

      verify(() => animeRepositoryMock.getAnimeGenres()).called(1);
    },
  );
}
