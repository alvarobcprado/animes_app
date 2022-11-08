import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class FailureComponent extends WidgetbookWidget {
  FailureComponent({Key? key})
      : super(
          name: 'Failure',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return Center(
                  child: Failure(
                      message: 'Ocorreu um erro',
                      buttonText: 'Tentar novamente',
                      onButtonPressed: () {}),
                );
              },
            ),
          ],
        );
}
