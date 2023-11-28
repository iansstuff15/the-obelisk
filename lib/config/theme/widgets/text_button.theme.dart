import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/borderRadius.config.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';

TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
  foregroundColor: MaterialStatePropertyAll(AppColors.textColor),
  textStyle: MaterialStateProperty.all(
      TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor)),
  shape:
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
    borderRadius: AppBorderRadius,
  )),
));
