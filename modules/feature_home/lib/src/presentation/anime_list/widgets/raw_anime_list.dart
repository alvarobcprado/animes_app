import 'package:core/core.dart';
import 'package:core/dependencies/routing.dart';
import 'package:design_system/design_system.dart';
import 'package:feature_home/generated/home_strings.dart';
import 'package:feature_home/src/domain/models/anime.dart';
import 'package:feature_home/src/routes/home_routes.dart';
import 'package:flutter/material.dart';

class RawAnimeList extends StatelessWidget {
  const RawAnimeList({
    Key? key,
    required ScrollController scrollController,
    required this.animeList,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final List<Anime> animeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CardList(
            scrollController: _scrollController,
            items: animeList
                .map(
                  (e) => LabeledCardItem(
                    imageUrl: e.image,
                    labels: [
                      LabeledCardText(
                        title: HomeStrings.of(context)!
                            .animeListPageLabeledCardTitle,
                        subtitle: e.title,
                      ),
                      LabeledCardText(
                        title: HomeStrings.of(context)!
                            .animeListPageLabeledCardGenre,
                        subtitle:
                            e.genres.isNotEmpty ? e.genres.join(", ") : '-',
                      ),
                      LabeledCardText(
                        title: HomeStrings.of(context)!
                            .animeListPageLabeledCardEpisodes,
                        subtitle: e.totalEpisodes == -1
                            ? HomeStrings.of(context)!.animeInformationSoon
                            : e.totalEpisodes.toString(),
                      ),
                      LabeledCardText(
                        title: HomeStrings.of(context)!.animeReleaseDate,
                        subtitle: e.release.isNotEmpty
                            ? e.release.convertDateToCurrentLocale(context)
                            : HomeStrings.of(context)!.animeInformationSoon,
                      ),
                    ],
                  ),
                )
                .toList(),
            onTap: (index) => GoRouter.of(context).pushDetails(
              animeList[index].id,
            ),
          ),
        ),
      ],
    );
  }
}
