// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class RegularRowComponent extends WidgetbookWidget {
  RegularRowComponent({Key? key})
      : super(
          name: 'RegularRow',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: RegularRow(title: 'Title:', subtitle: 'Subtitle')),
                );
              },
            ),
          ],
        );
}
