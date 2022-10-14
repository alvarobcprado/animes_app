// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class LabeledCardComponent extends WidgetbookWidget {
  LabeledCardComponent({Key? key})
      : super(
          name: 'LabeledCard',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      LabeledCard(
                        item: LabeledCardItem(
                          imageUrl: 'https://picsum.photos/200/300',
                          labels: [
                            LabeledCardText(
                              title: 'Título',
                              subtitle: 'Anime de ação',
                            ),
                            LabeledCardText(
                              title: 'Gênero',
                              subtitle: 'Ação, Aventura, Comédia',
                            ),
                            LabeledCardText(
                              title: 'Episódios',
                              subtitle: '12',
                            ),
                            LabeledCardText(
                              title: 'Status',
                              subtitle: 'Em andamento',
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
}
