import 'package:core/model/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:feature_home/data/mapper/remote_to_domain.dart';
import 'package:feature_home/data/remote/anime_remote_data_source.dart';
import 'package:feature_home/data/remote/dio_wrapper.dart';
import 'package:core/model/result.dart';
import 'package:feature_home/data/remote/model/anime_details/anime_details_data_response.dart';
import 'package:feature_home/data/remote/model/anime_list/anime_data_response.dart';
import 'package:feature_home/data/remote/model/genre_list/genre_data_response.dart';
import 'package:feature_home/domain/model/anime.dart';
import 'package:feature_home/domain/model/anime_details.dart';
import 'package:feature_home/domain/model/genre.dart';

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
