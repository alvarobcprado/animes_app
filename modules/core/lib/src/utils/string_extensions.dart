import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String convertDateToCurrentLocale(BuildContext context) {
    try {
      final currentLocal = Localizations.localeOf(context);

      final dateFormat =
          currentLocal == const Locale('pt') ? 'dd/MM/yyyy' : 'MM/dd/yyyy';
      final dateTime = DateTime.parse(this);

      return DateFormat(dateFormat).format(dateTime);
    } catch (e) {
      return '';
    }
  }

  bool isValidName() {
    const minLength = 2;
    return RegExp("[a-zA-Z\\s]+").hasMatch(trim()) && length >= minLength;
  }

  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(this);
  }
}
