// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

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
                        firstTitle: 'Nome:',
                        secondTitle: 'N° de temporadas:',
                        thirdTitle: 'Data de lançamento:',
                        fourthTitle: 'Gênero:',
                        firstSubtitle: 'Default',
                        secondSubtitle: 'Default',
                        thirdSubtitle: 'Default',
                        fourthSubtitle: 'Default',
                        imageUrl: 'https://picsum.photos/400/600',
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
