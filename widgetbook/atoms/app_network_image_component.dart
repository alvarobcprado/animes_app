// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class AppNetworkImageComponent extends WidgetbookWidget {
  AppNetworkImageComponent({Key? key})
      : super(
          name: 'AppNetworkImage',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return const Center(
                  child: AppNetworkImage(
                    imageUrl: 'https://picsum.photos/200',
                  ),
                );
              },
            ),
          ],
        );
}
