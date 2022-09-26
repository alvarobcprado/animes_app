// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class LabeledChipComponent extends WidgetbookWidget {
  LabeledChipComponent({Key? key})
      : super(
          name: 'LabeledChip',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Center(
                  child: LabeledChip(
                    label: 'Default chip',
                    onTap: (_) {},
                  ),
                );
              },
            ),
          ],
        );
}
