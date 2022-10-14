// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class CardListComponent extends WidgetbookWidget {
  CardListComponent({Key? key})
      : super(
          name: 'CardList',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                final list = [
                  'Um',
                  'Dois',
                  'Três',
                  'Quatro',
                  'Cinco',
                  'Seis',
                  'Sete',
                ];
                return CardList(
                  items: list
                      .map(
                        (e) => LabeledCardItem(
                          imageUrl: 'https://picsum.photos/200/300',
                          labels: [
                            LabeledCardText(
                              title: 'Título',
                              subtitle: e,
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
                      )
                      .toList(),
                  onTap: () {},
                );
              },
            ),
          ],
        );
}
