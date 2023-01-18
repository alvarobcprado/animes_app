import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/repositories/anime_repository.dart';
import 'package:feature_home/src/domain/use_cases/get_favorite_animes_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock animeRepositoryMock;
  late GetFavoriteAnimesUseCase getFavoriteAnimesUseCase;

  setUp(() {
    animeRepositoryMock = AnimeRepositoryMock();
    getFavoriteAnimesUseCase = GetFavoriteAnimesUseCase(
      repository: animeRepositoryMock,
    );
  });

  test(
    'given a call when the call is successful then should returns a List<AnimeDetails>',
    () async {
      when(() => animeRepositoryMock.getFavoriteAnimes())
          .thenAnswer((_) async => Result.success(mockAnimeDetailsList));

      final rawResult = await getFavoriteAnimesUseCase.call(params: null);

      final result = rawResult.whenOrNull(
        success: (favorites) => favorites,
      );

      expect(result, equals(mockAnimeDetailsList));

      verify(() => animeRepositoryMock.getFavoriteAnimes()).called(1);
    },
  );

  test(
    'given a call when the call is fail then should returns an Exception',
    () async {
      final mockException = Exception();

      when(() => animeRepositoryMock.getFavoriteAnimes())
          .thenAnswer((_) async => Result.error(mockException));

      final rawResult = await getFavoriteAnimesUseCase.call(params: null);

      final result = rawResult.whenOrNull(
        error: (exception) => exception,
      );

      expect(result, equals(mockException));

      verify(() => animeRepositoryMock.getFavoriteAnimes()).called(1);
    },
  );
}
