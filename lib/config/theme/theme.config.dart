import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/config/theme/widgets/appBar.themes.dart';
import 'package:the_obelisk/config/theme/widgets/elevate_button.theme.dart';
import 'package:the_obelisk/config/theme/widgets/input_decoration.theme.dart';
import 'package:the_obelisk/config/theme/widgets/outlined_button.theme.dart';
import 'package:the_obelisk/config/theme/widgets/text.theme.dart';
import 'package:the_obelisk/config/theme/widgets/text_button.theme.dart';

class AppTheme {
  static ThemeData main = ThemeData(
      primarySwatch: AppColors.primaryMaterial,
      textTheme: textTheme,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      inputDecorationTheme: inputDecorationTheme,
      appBarTheme: appBarTheme);
}
