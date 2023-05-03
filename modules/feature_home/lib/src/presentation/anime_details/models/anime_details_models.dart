import 'package:feature_home/src/domain/models/anime_details.dart';

abstract class AnimeDetailsState {
  const AnimeDetailsState();
}

class AnimeDetailsInitial extends AnimeDetailsState {
  const AnimeDetailsInitial();
}

class AnimeDetailsLoading extends AnimeDetailsState {
  const AnimeDetailsLoading();
}

class AnimeDetailsLoaded extends AnimeDetailsState {
  const AnimeDetailsLoaded(this.animeDetails);

  final AnimeDetails animeDetails;
}

class AnimeDetailsError extends AnimeDetailsState {
  final Exception error;

  const AnimeDetailsError(this.error);
}

abstract class AnimeDetailsAction {
  const AnimeDetailsAction();
}

class ShowFavoriteAnimeSnackBar extends AnimeDetailsAction {
  const ShowFavoriteAnimeSnackBar();
}

class ShowUnfavoriteAnimeSnackBar extends AnimeDetailsAction {
  const ShowUnfavoriteAnimeSnackBar();
}

class ShowFavoriteAnimeErrorSnackBar extends AnimeDetailsAction {
  const ShowFavoriteAnimeErrorSnackBar();
}

abstract class AnimeDetailsEvent {
  const AnimeDetailsEvent();
}

class ToggleFavoriteAnime extends AnimeDetailsEvent {
  const ToggleFavoriteAnime({required this.animeDetails});

  final AnimeDetails animeDetails;
}

class GetAnimeDetails extends AnimeDetailsEvent {
  const GetAnimeDetails();
}
