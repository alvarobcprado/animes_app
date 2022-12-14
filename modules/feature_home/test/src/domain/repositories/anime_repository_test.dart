import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper_models.dart';

class AnimeRemoteDataSourceMock extends Mock implements AnimeRemoteDataSource {}

class AnimeCacheDataSourceMock extends Mock implements AnimeCacheDataSource {}

void main() {
  late AnimeRemoteDataSourceMock animeRemoteDataSourceMock;
  late AnimeCacheDataSourceMock animeCacheDataSourceMock;
  late AnimeRepository animeRepository;

  setUp(() {
    animeRemoteDataSourceMock = AnimeRemoteDataSourceMock();
    animeCacheDataSourceMock = AnimeCacheDataSourceMock();
    animeRepository = AnimeRepositoryImpl(
      remoteDataSource: animeRemoteDataSourceMock,
      cacheDataSource: animeCacheDataSourceMock,
    );
  });

  // This is necessary to make the any() matcher work with the
  // AnimeDetailsAuxiliarCache type.
  setUpAll(() {
    registerFallbackValue(
      mockAnimeDetailsAuxiliarCache,
    );
  });

  group(
    'getAnimeDetails',
    () {
      test(
        'should return an [AnimeDetails] when the call to remote data source is successful',
        () async {
          when(() => animeRemoteDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.success(mockAnimeDetails));
          when(() => animeCacheDataSourceMock.saveAnimeDetails(any()))
              .thenAnswer((_) async {});
          when(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(any()))
              .thenAnswer((_) async => false);

          final rawResult = await animeRepository.getAnimeDetails(1);

          final result = rawResult.whenOrNull(
            success: (animeDetails) => animeDetails,
          );

          expect(result, equals(mockAnimeDetails));

          verify(() => animeRemoteDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verify(() => animeCacheDataSourceMock.saveAnimeDetails(any()))
              .called(1);
          verify(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(1))
              .called(1);
        },
      );

      test(
        'should return an [Exception] when the call to remote data source and cache data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.error(mockException));

          when(() => animeCacheDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.error(mockException));

          final rawResult = await animeRepository.getAnimeDetails(1);

          final result = rawResult.whenOrNull(
            error: (exception) => exception,
          );

          expect(result, equals(mockException));

          verify(() => animeRemoteDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verify(() => animeCacheDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verifyNever(
            () => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(1),
          );
        },
      );

      test(
        'should return an [AnimeDetails] when the call to remote data source is unsuccessful but the call to cache data source is successful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.error(mockException));

          when(() => animeCacheDataSourceMock.getAnimeDetails(any()))
              .thenAnswer(
            (_) async => Result.success(mockAnimeDetailsAuxiliarCache),
          );

          when(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(any()))
              .thenAnswer((_) async => false);

          final rawResult = await animeRepository.getAnimeDetails(1);

          final result = rawResult.whenOrNull(
            success: (animeDetails) => animeDetails,
          );

          expect(result, isA<AnimeDetails>());
          expect(result?.id, mockAnimeDetails.id);

          verify(() => animeRemoteDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verify(() => animeCacheDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verify(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(1))
              .called(1);
        },
      );
    },
  );

  group(
    'getAnimeGenres',
    () {
      test(
        'should return a List<AnimeGenre> when the call to remote data source is successful',
        () async {
          when(() => animeRemoteDataSourceMock.getAnimeGenres())
              .thenAnswer((_) async => Result.success(mockAnimeGenreList));

          when(() => animeCacheDataSourceMock.saveAnimeGenres(any()))
              .thenAnswer((_) async {});

          final rawResult = await animeRepository.getAnimeGenres();

          final result = rawResult.whenOrNull(success: (data) => data);

          expect(result, isNotNull);
          expect(result, equals(mockAnimeGenreList));

          verify(() => animeRemoteDataSourceMock.getAnimeGenres()) //
              .called(1);

          verify(() => animeCacheDataSourceMock.saveAnimeGenres(any()))
              .called(1);
        },
      );

      test(
        'should return an [Exception] when the call to remote data source and cache data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeGenres())
              .thenAnswer((_) async => Result.error(mockException));

          when(() => animeCacheDataSourceMock.getAnimeGenres())
              .thenAnswer((_) async => Result.error(mockException));

          final rawResult = await animeRepository.getAnimeGenres();

          final result = rawResult.whenOrNull(
            error: (error) => error,
          );

          expect(result, isNotNull);
          expect(result, equals(mockException));

          verify(() => animeRemoteDataSourceMock.getAnimeGenres()) //
              .called(1);
          verify(() => animeCacheDataSourceMock.getAnimeGenres()) //
              .called(1);
        },
      );

      test(
        'should return a [List<AnimeGenre>] when the call to remote data source is unsuccessful but the call to cache data source is successful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeGenres())
              .thenAnswer((_) async => Result.error(mockException));

          when(() => animeCacheDataSourceMock.getAnimeGenres()).thenAnswer(
            (_) async => Result.success(mockAnimeGenreList.toCache()),
          );

          final rawResult = await animeRepository.getAnimeGenres();

          final result = rawResult.whenOrNull(success: (data) => data);

          expect(result, isNotNull);
          expect(result, isA<List<Genre>>());
          expect(result?.length, mockAnimeGenreList.length);

          verify(() => animeRemoteDataSourceMock.getAnimeGenres()) //
              .called(1);
          verify(() => animeCacheDataSourceMock.getAnimeGenres()) //
              .called(1);
        },
      );
    },
  );

  group(
    'getAnimeList',
    () {
      test(
        'should return a [List<Anime>] when the call to remote data source is successful',
        () async {
          when(() => animeRemoteDataSourceMock.getAnimeList(any()))
              .thenAnswer((_) async => Result.success(mockAnimeList));

          final rawResult = await animeRepository.getAnimeList(1);

          final result = rawResult.whenOrNull(success: (data) => data);

          expect(result, isNotNull);
          expect(result, equals(mockAnimeList));

          verify(() => animeRemoteDataSourceMock.getAnimeList(any())).called(1);
        },
      );

      test(
        'should return an [Exception] when the call to remote data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeList(any()))
              .thenAnswer((_) async => Result.error(mockException));

          final rawResult = await animeRepository.getAnimeList(1);

          final result = rawResult.whenOrNull(
            error: (error) => error,
          );

          expect(result, isNotNull);
          expect(result, equals(mockException));

          verify(() => animeRemoteDataSourceMock.getAnimeList(any())).called(1);
        },
      );
    },
  );

  group(
    'getAnimeListBySearch',
    () {
      test(
        'should return a [List<Anime>] when the call to remote data source is successful',
        () async {
          when(
            () => animeRemoteDataSourceMock.getAnimeListBySearch(any(), any()),
          ).thenAnswer((_) async => Result.success(mockAnimeList));

          final rawResult = await animeRepository.getAnimeListBySearch(
            'test',
            1,
          );

          final result = rawResult.whenOrNull(success: (data) => data);

          expect(result, isNotNull);
          expect(result, equals(mockAnimeList));

          verify(
            () => animeRemoteDataSourceMock.getAnimeListBySearch(any(), any()),
          ).called(1);
        },
      );

      test(
        'should return an [Exception] when the call to remote data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(
            () => animeRemoteDataSourceMock.getAnimeListBySearch(any(), any()),
          ).thenAnswer((_) async => Result.error(mockException));

          final rawResult = await animeRepository.getAnimeListBySearch(
            'test',
            1,
          );

          final result = rawResult.whenOrNull(error: (error) => error);

          expect(result, isNotNull);
          expect(result, equals(mockException));

          verify(
            () => animeRemoteDataSourceMock.getAnimeListBySearch(any(), any()),
          ).called(1);
        },
      );
    },
  );

  group(
    'getAnimeListByGenre',
    () {
      test(
        'should return a [List<Anime>] when the call to remote data source is successful',
        () async {
          when(
            () => animeRemoteDataSourceMock.getAnimeListByGenre(any(), any()),
          ).thenAnswer((_) async => Result.success(mockAnimeList));

          final rawResult = await animeRepository.getAnimeListByGenre(
            'test',
            1,
          );

          final result = rawResult.whenOrNull(success: (data) => data);

          expect(result, isNotNull);
          expect(result, equals(mockAnimeList));

          verify(
            () => animeRemoteDataSourceMock.getAnimeListByGenre(any(), any()),
          ).called(1);
        },
      );

      test(
        'should return an [Exception] when the call to remote data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(
            () => animeRemoteDataSourceMock.getAnimeListByGenre(any(), any()),
          ).thenAnswer((_) async => Result.error(mockException));

          final rawResult = await animeRepository.getAnimeListByGenre(
            'test',
            1,
          );

          final result = rawResult.whenOrNull(error: (error) => error);

          expect(result, isNotNull);
          expect(result, equals(mockException));

          verify(
            () => animeRemoteDataSourceMock.getAnimeListByGenre(any(), any()),
          ).called(1);
        },
      );
    },
  );

  group(
    'toggleFavoriteAnime',
    () {
      test(
        'should save favorite anime to cache data source when the animeDetails is not favorite yet',
        () async {
          final animeDetails = mockAnimeDetails;

          when(() => animeCacheDataSourceMock.saveFavoriteAnime(any()))
              .thenAnswer((_) async => const Result.success(null));

          when(() => animeCacheDataSourceMock.removeFavoriteAnime(any()))
              .thenAnswer((_) async => const Result.success(null));

          await animeRepository.toggleFavoriteAnime(animeDetails);

          verify(() => animeCacheDataSourceMock.saveFavoriteAnime(any()))
              .called(1);

          verifyNever(
              () => animeCacheDataSourceMock.removeFavoriteAnime(any()));
        },
      );

      test(
        'should remove anime from favorite cache data source when the animeDetails is already favorite',
        () async {
          final animeDetails = mockAnimeDetails;

          animeDetails.isFavorite = true;

          when(() => animeCacheDataSourceMock.saveFavoriteAnime(any()))
              .thenAnswer((_) async => const Result.success(null));

          when(() => animeCacheDataSourceMock.removeFavoriteAnime(any()))
              .thenAnswer((_) async => const Result.success(null));

          await animeRepository.toggleFavoriteAnime(animeDetails);

          verify(() => animeCacheDataSourceMock.removeFavoriteAnime(any()))
              .called(1);

          verifyNever(() => animeCacheDataSourceMock.saveFavoriteAnime(any()));
        },
      );
    },
  );
}
