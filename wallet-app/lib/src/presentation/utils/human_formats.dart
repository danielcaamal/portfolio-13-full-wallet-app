import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HumanFormats {
  static String numberToCurrency(double number) {
    final formatterNumber = NumberFormat.simpleCurrency(locale: 'en_US');
    return formatterNumber.format(number);
  }

  static String dateToLocal(DateTime date) {
    final formatterDate = DateFormat('dd/MM/yyyy');
    return formatterDate.format(date);
  }

  static Color hexToColor(String? hexColor) {
    if (hexColor == null) {
      return Colors.transparent;
    }
    return Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
