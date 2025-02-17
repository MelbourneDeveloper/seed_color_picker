import 'package:flutter/material.dart';

const initialColor = Color(0xFFEE3333);

int? hexToInteger(String hex) => int.tryParse(hex, radix: 16);

Color contrastColor(Color color) {
  final Brightness brightness = ThemeData.estimateBrightnessForColor(color);
  return brightness == Brightness.dark ? Colors.white : Colors.black;
}

extension StringColorExtensions on String {
  Color? toColor() {
    var number = hexToInteger(this);
    if (number == null) {
      return null;
    }
    return Color(number);
  }
}
