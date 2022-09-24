// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ImageCardButtonComponent extends WidgetbookWidget {
  ImageCardButtonComponent({Key? key})
      : super(
          name: 'ImageCardButton',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ImageCardButton(
                      buttonIcon: Icons.favorite_border,
                      buttonLabel: 'Favorite',
                      imageUrl: 'https://picsum.photos/1120',
                      onButtonPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
