import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double getWidthPerc(double percentage) {
    return MediaQuery.of(this).size.width * percentage;
  }
}
