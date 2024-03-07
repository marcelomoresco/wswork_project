import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatToMoney(BuildContext context) {
    final format = NumberFormat(
      '##,###,##0.00',
      "pt-BR",
    );
    final double number = double.parse(replaceAll(RegExp('[^0-9]'), '')) / 10;
    return format.format(number);
  }

  String toCapitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
