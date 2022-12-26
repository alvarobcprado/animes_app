import 'package:core/core.dart';
import 'package:core/dependencies/network.dart';
import 'package:feature_home/src/data/mappers/mappers.dart';
import 'package:feature_home/src/data/remote/remote.dart';
import 'package:feature_home/src/domain/models/models.dart';

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  AnimeRemoteDataSourceImpl({
    required Dio dio,
    required HomeDioWrapper wrapper,
  })  : _dio = dio,
        _wrapper = wrapper;

  final Dio _dio;
  final HomeDioWrapper _wrapper;

  @override
  Future<Result<AnimeDetails>> getAnimeDetails(int id) {
    final result = _wrapper(() => _dio.get('/anime/$id'));
    return result.then(
      (value) => value.when(
        success: (success) {
          final response = AnimeDetailsDataResponse.fromJson(success.data);
          if (response.animeDetails != null) {
            return Result.success(response.animeDetails!.toDomain());
          }
          return Result.error(NullResponseException());
        },
        error: (error) {
          return Result.error(error);
        },
      ),
    );
  }

  @override
  Future<Result<List<Genre>>> getAnimeGenres() {
    final result = _wrapper(() => _dio.get('/genres/anime'));
    return result.then(
      (value) => value.when(
        success: (success) {
          final response = GenreDataResponse.fromJson(success.data);
          return Result.success(response.toDomain());
        },
        error: (error) {
          return Result.error(error);
        },
      ),
    );
  }

  @override
  Future<Result<List<Anime>>> getAnimeList(int page) async {
    final endpoint = '/top/anime?page=$page';
    final resultResponse = await _wrapper(() => _dio.get(endpoint));

    return _parseAnimeListResponse(resultResponse, page);
  }

  @override
  Future<Result<List<Anime>>> getAnimeListBySearch(
    String query,
    int page,
  ) async {
    final endpoint = '/anime?q=$query&page=$page';
    final resultResponse = await _wrapper(() => _dio.get(endpoint));

    return _parseAnimeListResponse(resultResponse, page);
  }

  @override
  Future<Result<List<Anime>>> getAnimeListByGenre(
    String genreId,
    int page,
  ) async {
    final endpoint = '/anime?genres=$genreId&page=$page';
    final resultResponse = await _wrapper(() => _dio.get(endpoint));

    return _parseAnimeListResponse(resultResponse, page);
  }

  Result<List<Anime>> _parseAnimeListResponse(
    Result resultResponse,
    int page,
  ) {
    return resultResponse.when(
      success: (success) {
        final response = AnimeDataResponse.fromJson(success.data);
        return Result.success(response.animes?.toDomain() ?? []);
      },
      error: (error) {
        if (page > 1) {
          return Result.error(PaginationErrorException());
        }
        return Result.error(error);
      },
    );
  }
}
