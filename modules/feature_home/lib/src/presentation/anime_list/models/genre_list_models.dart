import 'package:feature_home/src/domain/models/models.dart';

abstract class GenreListState {
  const GenreListState();
}

class GenreListLoading extends GenreListState {
  const GenreListLoading();
}

class GenreListLoaded extends GenreListState {
  final List<Genre> genreList;
  const GenreListLoaded({required this.genreList});
}

class GenreListError extends GenreListState {
  const GenreListError({required this.error});

  final Exception error;
}

abstract class GenreListEvent {
  const GenreListEvent();
}

class GetGenres extends GenreListEvent {
  const GetGenres();
}
