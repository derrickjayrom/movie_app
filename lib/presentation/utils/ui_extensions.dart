import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension PaddingExtension on Widget {
  Widget paddingB(double value) => Padding(
    padding: EdgeInsets.only(bottom: value),
    child: this,
  );
}

class AppColors {
  static const Color unselectedItem = Color(0xFF9CA3AF);
}
