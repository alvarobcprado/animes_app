import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/data/cache/cache.dart';
import 'package:feature_home/src/data/remote/anime_remote_data_source.dart';
import 'package:feature_home/src/data/repositories/anime_repository_impl.dart';
import 'package:feature_home/src/domain/models/anime_details.dart';
import 'package:feature_home/src/domain/repositories/repositories.dart';
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
        'should return a [Result.success] with [AnimeDetails] when the call to remote data source is successful',
        () async {
          when(() => animeRemoteDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.success(mockAnimeDetails));
          when(() => animeCacheDataSourceMock.saveAnimeDetails(any()))
              .thenAnswer((_) async {});
          when(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(any()))
              .thenAnswer((_) async => false);

          final result = await animeRepository.getAnimeDetails(1);

          expect(result, equals(Result.success(mockAnimeDetails)));

          verify(() => animeRemoteDataSourceMock.getAnimeDetails(1)) //
              .called(1);
          verify(() => animeCacheDataSourceMock.saveAnimeDetails(any()))
              .called(1);
          verify(() => animeCacheDataSourceMock.verifyIfAnimeIsFavorite(1))
              .called(1);
        },
      );

      test(
        'should return a [Result.error] with [Exception] when the call to remote data source and cache data source is unsuccessful',
        () async {
          final mockException = Exception();

          when(() => animeRemoteDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.error(mockException));

          when(() => animeCacheDataSourceMock.getAnimeDetails(any()))
              .thenAnswer((_) async => Result.error(mockException));

          final result = await animeRepository.getAnimeDetails(1);

          expect(result, equals(Result<AnimeDetails>.error(mockException)));

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
        'should return a [Result.success] with [AnimeDetails] when the call to remote data source is unsuccessful but the call to cache data source is successful',
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

          final result = await animeRepository.getAnimeDetails(1);

          expect(
            result,
            isA<Result<AnimeDetails>>(),
          );

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
}
