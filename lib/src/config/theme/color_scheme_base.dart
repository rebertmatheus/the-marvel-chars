import 'package:flutter/material.dart';

class ColorSchemeBase {
  static ColorScheme get darkMode => const ColorScheme.dark(
        primary: Color(0xffFFBA21),
        surface: Color(0xffFFBA21),
        onSurface: Colors.black,
      );
  static ColorScheme get lightMode => const ColorScheme.light(
        primary: Color(0xff9F1D18),
        onPrimary: Colors.white,
      );
}
