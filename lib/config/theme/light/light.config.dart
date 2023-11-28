import 'package:flutter/material.dart';
import 'package:the_obelisk/config/theme/luminance/luminance.config.dart';

class LightModeColors {
  static Color primary = const Color.fromRGBO(23, 23, 23, 1);
  static MaterialStateProperty<Color> primaryButtonColor =
      MaterialStateProperty.all(primary);
  static MaterialStatePropertyAll<Color> primaryButtonTextColor =
      const MaterialStatePropertyAll(Colors.white);
  static MaterialColor primaryMaterial = MaterialColor(0xFF1A1B1B, luminance);
  static MaterialStateProperty<Color> primaryMaterialState =
      MaterialStateProperty.all(primary);
  static Color splashBackgroundColor = const Color.fromARGB(255, 27, 27, 27);
  static Color splashForegroundColor = const Color(0xFFFFFFFF);
  static Color scaffoldBackground = const Color(0xFFFFFFFF);
  static Color textColor = const Color.fromARGB(255, 23, 23, 23);
  static Color textBox = const Color.fromARGB(255, 228, 228, 228);
  static Color container = const Color(0xDDF1F1F1);
  static Color elevatedContainer = const Color.fromRGBO(243, 142, 54, 1);
  static Color secondary = const Color(0xFFEBC20A);
  static Color textErrorColor = Colors.red;
}
