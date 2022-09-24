// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:design_system/design_system.dart';

class FilterSelectChipListComponent extends WidgetbookWidget {
  FilterSelectChipListComponent({Key? key})
      : super(
          name: 'FilterSelectChipList',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Center(
                  child: FilterSelectChipList(
                    items: _chipList,
                    onSelected: (isActive, index) {
                      if (kDebugMode) {
                        print(
                          'Chip $index ${isActive ? 'activated' : 'deactivated'}',
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ],
        );
}

final _chipList = List.generate(15, (index) => 'Chip $index');
