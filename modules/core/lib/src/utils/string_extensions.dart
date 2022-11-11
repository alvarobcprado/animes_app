import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String convertDateToCurrentLocale(BuildContext context) {
    final currentLocal = Localizations.localeOf(context);

    final dateFormat =
        currentLocal == const Locale('pt') ? 'dd/MM/yyyy' : 'MM/dd/yyyy';
    final dateTime = DateTime.parse(this);

    return DateFormat(dateFormat).format(dateTime);
  }
}
