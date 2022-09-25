// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'atoms/app_network_image_component.dart';
import 'atoms/labeled_icon_button_component.dart';
import 'package:design_system/design_system.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'Design System',
          folders: [
            WidgetbookFolder(
              name: 'Atoms',
              widgets: [
                LabeledIconButtonComponent(),
                AppNetworkImageComponent(),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'design_system_book'),
      lightTheme: lightAppThemeData,
      darkTheme: darkAppThemeData,
    );
  }
}
