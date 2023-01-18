import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/repositories/anime_repository.dart';
import 'package:feature_home/src/domain/use_cases/get_anime_details_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRepositoryMock extends Mock implements AnimeRepository {}

void main() {
  late AnimeRepositoryMock animeRepositoryMock;
  late GetAnimeDetailsUseCase getAnimeDetailsUseCase;

  setUp(() {
    animeRepositoryMock = AnimeRepositoryMock();
    getAnimeDetailsUseCase = GetAnimeDetailsUseCase(
      repository: animeRepositoryMock,
    );
  });

  test(
    'given a call when the call is successful then should returns an AnimeDetails',
    () async {
      when(() => animeRepositoryMock.getAnimeDetails(any()))
          .thenAnswer((_) async => Result.success(mockAnimeDetails));

      final rawResult = await getAnimeDetailsUseCase.call(
          params: GetAnimeDetailsUseCaseParams(id: 1));

      final result = rawResult.whenOrNull(
        success: (animeDetails) => animeDetails,
      );

      expect(result, equals(mockAnimeDetails));

      verify(() => animeRepositoryMock.getAnimeDetails(1)).called(1);
    },
  );

  test(
    'given a call when the call is fail then should returns an Exception',
    () async {
      final mockException = Exception();

      when(() => animeRepositoryMock.getAnimeDetails(any()))
          .thenAnswer((_) async => Result.error(mockException));

      final rawResult = await getAnimeDetailsUseCase.call(
          params: GetAnimeDetailsUseCaseParams(id: 1));

      final result = rawResult.whenOrNull(
        error: (exception) => exception,
      );

      expect(result, equals(mockException));

      verify(() => animeRepositoryMock.getAnimeDetails(1)).called(1);
    },
  );
}
