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
                  listLength: list.length,
                  firstTitle: 'Nome:',
                  secondTitle: 'N° de temporadas:',
                  thirdTitle: 'Data de lançamento:',
                  fourthTitle: 'Gênero:',
                  firstSubtitles: list,
                  secondSubtitles: list,
                  thirdSubtitles: list,
                  fourthSubtitles: list,
                  imageUrl: const [
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                    'https://picsum.photos/200/300',
                  ],
                  onTap: () {},
                );
              },
            ),
          ],
        );
}
