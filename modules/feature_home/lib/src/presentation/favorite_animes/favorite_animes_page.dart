import 'package:core/core.dart';
import 'package:core/dependencies/dependency_injection.dart';
import 'package:core/dependencies/state_management.dart';
import 'package:core/dependencies/utils.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/domain/use_cases/use_cases.dart';
import 'package:feature_home/src/presentation/favorite_animes/favorite_animes_notifier.dart';
import 'package:feature_home/src/presentation/favorite_animes/models/favorite_animes_models.dart';
import 'package:feature_home/src/presentation/favorite_animes/widgets/favorite_anime_list.dart';
import 'package:flutter/material.dart';

class FavoriteAnimesPage extends StatefulWidget {
  const FavoriteAnimesPage({
    super.key,
    required this.notifier,
  });

  final FavoriteAnimesNotifier notifier;

  static Widget create() =>
      ProxyProvider<GetFavoriteAnimesUseCase, FavoriteAnimesNotifier>(
        update: (_, getFavoriteAnimesUseCase, notifier) =>
            notifier ??
            FavoriteAnimesNotifier(
              getFavoriteAnimesUseCase: getFavoriteAnimesUseCase,
            ),
        child: Consumer<FavoriteAnimesNotifier>(
          builder: (_, notifier, __) => FavoriteAnimesPage(notifier: notifier),
        ),
      );

  @override
  State<FavoriteAnimesPage> createState() => _FavoriteAnimesPageState();
}

class _FavoriteAnimesPageState extends State<FavoriteAnimesPage> {
  FavoriteAnimesNotifier get _notifier => widget.notifier;
  final _focusDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _notifier.process(const GetFavoriteAnimes());
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorsFoundation>()!;
    return FocusDetector(
      key: _focusDetectorKey,
      onFocusGained: () {
        _notifier.process(const GetFavoriteAnimes());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(HomeStrings.of(context)!.favoriteAnimesPageTitleAppBar),
        ),
        body: PaddingBox.ltrbFactor(
          leftFactor: 2,
          rightFactor: 2,
          child: ReStateWidget<FavoriteAnimesState>(
            reState: _notifier,
            builder: (context, state, child) {
              if (state is FavoriteAnimesError) {
                final message = state.error.getErrorMessage(context);
                return Center(
                  child: Failure(
                    message: message,
                    buttonText: CoreStrings.of(context)!.tryAgain,
                    onButtonPressed: () => _notifier.process(
                      const GetFavoriteAnimes(),
                    ),
                  ),
                );
              }
              if (state is FavoriteAnimesLoaded) {
                final favorites = state.animeList;
                return Visibility(
                  visible: favorites.isNotEmpty,
                  replacement: Center(
                    child: Text(
                      HomeStrings.of(context)!.favoriteAnimesPageNoAnimes,
                    ),
                  ),
                  child: FavoriteAnimeList(favorites: favorites),
                );
              }

              return Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
