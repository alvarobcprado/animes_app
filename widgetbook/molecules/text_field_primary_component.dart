// ignore_for_file: depend_on_referenced_packages

import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class TextFieldPrimaryComponent extends WidgetbookWidget {
  TextFieldPrimaryComponent({Key? key})
      : super(
          name: 'TextFieldPrimary',
          useCases: [
            WidgetbookUseCase(
              name: 'Name',
              builder: (context) {
                return Center(
                  child: TextFieldPrimary(
                    controller: TextEditingController(),
                    hintText: 'Name',
                    errorText: null,
                    keyboardType: TextInputType.name,
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Email',
              builder: (context) {
                return Center(
                  child: TextFieldPrimary(
                    controller: TextEditingController(),
                    hintText: 'Email',
                    errorText: null,
                    keyboardType: TextInputType.emailAddress,
                  ),
                );
              },
            ),
          ],
        );
}
