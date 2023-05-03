import 'package:feature_home/feature_home.dart';

abstract class FavoriteAnimesState {
  const FavoriteAnimesState();
}

class FavoriteAnimesInitial extends FavoriteAnimesState {
  const FavoriteAnimesInitial();
}

class FavoriteAnimesLoading extends FavoriteAnimesState {
  const FavoriteAnimesLoading();
}

class FavoriteAnimesLoaded extends FavoriteAnimesState {
  const FavoriteAnimesLoaded({required this.animeList});

  final List<AnimeDetails> animeList;
}

class FavoriteAnimesError extends FavoriteAnimesState {
  final Exception error;

  const FavoriteAnimesError(this.error);
}

abstract class FavoriteAnimesEvent {
  const FavoriteAnimesEvent();
}

class GetFavoriteAnimes extends FavoriteAnimesEvent {
  const GetFavoriteAnimes();
}
