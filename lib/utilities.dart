import 'package:flutter/material.dart';

Color customColor({String? date}) {
  switch (date) {
    case 'Yesterday':
      return Colors.redAccent;
    case 'Today':
      return Colors.green.shade600;
    case 'Tomorrow':
      return Colors.cyan.shade700;
    default:
      return Colors.amber.shade500;
  }
}
