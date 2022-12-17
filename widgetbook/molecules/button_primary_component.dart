// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonPrimaryComponent extends WidgetbookWidget {
  ButtonPrimaryComponent({Key? key})
      : super(
          name: 'ButtonPrimary',
          useCases: [
            WidgetbookUseCase(
              name: 'Loading',
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ButtonPrimary(
                      isLoading: true,
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Text',
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ButtonPrimary(
                      isLoading: false,
                      onPressed: () {},
                      buttonText: 'ENTRAR',
                    ),
                  ),
                );
              },
            ),
          ],
        );
}
