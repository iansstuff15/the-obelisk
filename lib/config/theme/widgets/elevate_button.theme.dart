import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/borderRadius.config.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
  foregroundColor: MaterialStateProperty.all(AppColors.textColor),
  textStyle:
      MaterialStateProperty.all(TextStyle(fontWeight: AppFontWeight.black)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: AppBorderRadius,
  )),
));
