import 'package:intl/intl.dart';

extension StringExtensions on String {
  String convertDateToBrLocale() {
    const dateFormat = 'dd/MM/yyyy';
    final dateTime = DateTime.parse(this);

    return DateFormat(dateFormat).format(dateTime);
  }
}
