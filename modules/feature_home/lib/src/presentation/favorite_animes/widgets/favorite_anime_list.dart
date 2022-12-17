import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/domain/models/anime_details.dart';
import 'package:feature_home/src/routes/home_routes.dart';
import 'package:flutter/material.dart';

class FavoriteAnimeList extends StatelessWidget {
  const FavoriteAnimeList({
    Key? key,
    required this.favorites,
  }) : super(key: key);

  final List<AnimeDetails> favorites;

  @override
  Widget build(BuildContext context) {
    return CardList(
      items: favorites
          .map(
            (e) => LabeledCardItem(
              imageUrl: e.image,
              labels: [
                LabeledCardText(
                  title: HomeStrings.of(context)!.animeListPageLabeledCardTitle,
                  subtitle: e.title,
                ),
                LabeledCardText(
                  title: HomeStrings.of(context)!.animeReleaseDate,
                  subtitle: e.release.isNotEmpty
                      ? e.release.convertDateToCurrentLocale(context)
                      : HomeStrings.of(context)!.animeInformationSoon,
                ),
                LabeledCardText(
                  title: HomeStrings.of(context)!.animeEndDate,
                  subtitle: e.end.isNotEmpty
                      ? e.end.convertDateToCurrentLocale(context)
                      : HomeStrings.of(context)!.animeInformationSoon,
                ),
              ],
            ),
          )
          .toList(),
      onTap: (index) => context.goToDetails(
        favorites[index].id,
      ),
    );
  }
}
