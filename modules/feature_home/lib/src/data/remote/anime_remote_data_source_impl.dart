import 'package:core/core.dart';
import 'package:core/dependencies/network.dart';
import 'package:feature_home/src/data/mappers/mappers.dart';
import 'package:feature_home/src/data/remote/remote.dart';
import 'package:feature_home/src/domain/models/models.dart';

class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  AnimeRemoteDataSourceImpl({
    required Dio dio,
    required DioWrapper wrapper,
  })  : _dio = dio,
        _wrapper = wrapper;

  final Dio _dio;
  final DioWrapper _wrapper;
  static const baseUrl = 'https://api.jikan.moe/v4/';
  String? _nextPage;

  @override
  Future<Result<List<Anime>>> getAnimeList() async {
    final page = _nextPage ?? '${baseUrl}top/anime';
    final result = _wrapper(() => _dio.get(page));
    return result.then(
      (value) => value.when(
        success: (success) {
          final response = AnimeDataResponse.fromJson(success.data);
          _nextPage = response.url?.next;
          return Result.success(response.animes?.toDomain() ?? []);
        },
        error: (error) {
          return Result.error(error);
        },
      ),
    );
  }

  @override
  Future<Result<AnimeDetails>> getAnimeDetails(int id) {
    final result = _wrapper(() => _dio.get('${baseUrl}anime/$id'));
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
    final result = _wrapper(() => _dio.get('${baseUrl}genres/anime'));
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
  Future<Result<List<Anime>>> getAnimeListBySearch(String query) {
    final result = _wrapper(() => _dio.get('${baseUrl}anime?q=$query'));
    return result.then(
      (value) => value.when(
        success: (success) {
          final response = AnimeDataResponse.fromJson(success.data);
          return Result.success(response.animes?.toDomain() ?? []);
        },
        error: (error) {
          return Result.error(error);
        },
      ),
    );
  }
}
