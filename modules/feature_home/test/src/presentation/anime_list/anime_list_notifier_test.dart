import 'package:core/core.dart';
import 'package:core/dependencies/testing.dart';
import 'package:feature_home/src/domain/models/models.dart';
import 'package:feature_home/src/domain/use_cases/use_cases.dart';
import 'package:feature_home/src/presentation/anime_list/anime_list_notifier.dart';
import 'package:feature_home/src/presentation/anime_list/models/anime_list_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:re_state_action_test/re_state_action_test.dart';

import '../../../helper_models.dart';

class MockGetAnimeListUseCase extends Mock implements GetAnimeListUseCase {}

class MockGetSearchedAnimeListUseCase extends Mock
    implements GetSearchedAnimeListUseCase {}

class MockGetAnimesByGenreUseCase extends Mock
    implements GetAnimesByGenreUseCase {}

void main() {
  AnimeListNotifier _buildAnimeListNotifier() {
    final mockGetAnimeListUseCase = MockGetAnimeListUseCase();
    final mockGetSearchedAnimeListUseCase = MockGetSearchedAnimeListUseCase();
    final mockGetAnimesByGenreUseCase = MockGetAnimesByGenreUseCase();

    return AnimeListNotifier(
      getAnimeListUseCase: mockGetAnimeListUseCase,
      getSearchedAnimeListUseCase: mockGetSearchedAnimeListUseCase,
      getAnimesByGenreUseCase: mockGetAnimesByGenreUseCase,
    );
  }

  setUpAll(() {
    registerFallbackValue(GetAnimeDetailsUseCaseParams(id: 1));
    registerFallbackValue(GetAnimeListUseCaseParams(page: 1));
    registerFallbackValue(GetSearchedAnimeListUseCaseParams(
      page: 1,
      query: '',
    ));
  });

  group(
    'AnimeListNotifier',
    () {
      reStateTest<AnimeListNotifier, AnimeListModel>(
        'should emit AnimeListModel.initial() when initialized',
        buildReState: () {
          return _buildAnimeListNotifier();
        },
        expectStates: () => [AnimeListModel.initial()],
      );

      reStateTest<AnimeListNotifier, AnimeListModel>(
        'should emit AnimeList when process GetAnimes event',
        buildReState: () {
          final mockGetAnimeListUseCase = MockGetAnimeListUseCase();
          final mockGetSearchedAnimeListUseCase =
              MockGetSearchedAnimeListUseCase();
          final mockGetAnimesByGenreUseCase = MockGetAnimesByGenreUseCase();

          when(
            () => mockGetAnimeListUseCase.call(params: any(named: 'params')),
          ).thenAnswer((_) async => Result<List<Anime>>.success(mockAnimeList));

          return AnimeListNotifier(
            getAnimeListUseCase: mockGetAnimeListUseCase,
            getSearchedAnimeListUseCase: mockGetSearchedAnimeListUseCase,
            getAnimesByGenreUseCase: mockGetAnimesByGenreUseCase,
          );
        },
        actReState: (reState) => reState.process(const GetAnimes()),
        expectStates: () => contains(AnimeListModel(animes: mockAnimeList)),
      );

      reStateTest<AnimeListNotifier, AnimeListModel>(
        'should emit exception when fail to process GetAnimes event',
        buildReState: () {
          final mockGetAnimeListUseCase = MockGetAnimeListUseCase();
          final mockGetSearchedAnimeListUseCase =
              MockGetSearchedAnimeListUseCase();
          final mockGetAnimesByGenreUseCase = MockGetAnimesByGenreUseCase();

          when(
            () => mockGetAnimeListUseCase.call(params: any(named: 'params')),
          ).thenAnswer((_) async => Result<List<Anime>>.error(mockException));

          return AnimeListNotifier(
            getAnimeListUseCase: mockGetAnimeListUseCase,
            getSearchedAnimeListUseCase: mockGetSearchedAnimeListUseCase,
            getAnimesByGenreUseCase: mockGetAnimesByGenreUseCase,
          );
        },
        actReState: (reState) => reState.process(const GetAnimes()),
        expectStates: () => contains(
          AnimeListModel(animes: [], error: mockException),
        ),
      );

      reStateTest<AnimeListNotifier, AnimeListModel>(
        'should emit pagination exception when fail to process GetAnimes event',
        buildReState: () {
          final mockGetAnimeListUseCase = MockGetAnimeListUseCase();
          final mockGetSearchedAnimeListUseCase =
              MockGetSearchedAnimeListUseCase();
          final mockGetAnimesByGenreUseCase = MockGetAnimesByGenreUseCase();

          when(
            () => mockGetAnimeListUseCase.call(params: any(named: 'params')),
          ).thenAnswer(
            (_) async => Result<List<Anime>>.error(mockPaginationException),
          );

          return AnimeListNotifier(
            getAnimeListUseCase: mockGetAnimeListUseCase,
            getSearchedAnimeListUseCase: mockGetSearchedAnimeListUseCase,
            getAnimesByGenreUseCase: mockGetAnimesByGenreUseCase,
          );
        },
        actReState: (reState) => reState.process(const GetAnimes()),
        expectStates: () => contains(
          AnimeListModel(animes: [], hasPaginationError: true),
        ),
      );
    },
  );
}
