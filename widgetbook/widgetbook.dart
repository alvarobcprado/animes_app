// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'atoms/app_network_image_component.dart';
import 'atoms/labeled_card_component.dart';
import 'atoms/labeled_chip_component.dart';
import 'atoms/labeled_icon_button_component.dart';
import 'atoms/regular_row_component.dart';
import 'molecules/app_search_bar_component.dart';
import 'molecules/button_primary_component.dart';
import 'molecules/card_list_component.dart';
import 'molecules/failure_component.dart';
import 'molecules/filter_select_chip_list.dart';
import 'molecules/image_card_button_component.dart';
import 'molecules/text_field_primary_component.dart';

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
                LabeledChipComponent(),
                RegularRowComponent(),
                LabeledCardComponent(),
              ],
            ),
            WidgetbookFolder(
              name: 'Molecules',
              widgets: [
                FilterSelectChipListComponent(),
                AppSearchBarComponent(),
                ImageCardButtonComponent(),
                CardListComponent(),
                FailureComponent(),
                ButtonPrimaryComponent(),
                TextFieldPrimaryComponent(),
              ],
            ),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'design_system_book'),
      lightTheme: lightAppThemeData,
      darkTheme: darkAppThemeData,
      defaultTheme: ThemeMode.light,
    );
  }
}
