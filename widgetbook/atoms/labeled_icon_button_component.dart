// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class LabeledIconButtonComponent extends WidgetbookWidget {
  LabeledIconButtonComponent({Key? key})
      : super(
          name: 'LabeledIconButton',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return const Center(
                  child: LabeledIconButton(
                    label: 'Add Buton',
                    icon: Icons.add,
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Custom color',
              builder: (context) {
                return const Center(
                  child: LabeledIconButton(
                    label: 'Add Buton',
                    icon: Icons.add,
                    color: Colors.red,
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Reduced size',
              builder: (context) {
                return const Center(
                  child: LabeledIconButton(
                    label: 'Add Buton',
                    icon: Icons.add,
                    isReducedSize: true,
                  ),
                );
              },
            ),
          ],
        );
}
