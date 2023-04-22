import 'dart:io';

import 'package:flutter/material.dart';

ThemeData theme(ColorScheme colors, {String fontFamily = ''}) {
  if (fontFamily.isEmpty) {
    fontFamily = Platform.isIOS ? 'Helvetica' : 'Roboto';
  }

  return ThemeData(colorScheme: colors);
}
