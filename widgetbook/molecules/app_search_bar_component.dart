// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class AppSearchBarComponent extends WidgetbookWidget {
  AppSearchBarComponent({Key? key})
      : super(
          name: 'AppSearchBar',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: AppSearchBar(
                      controller: TextEditingController(),
                      hintText: 'Search for an anime',
                      onChanged: (value) {
                        if (kDebugMode) {
                          print('Search value: $value');
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
