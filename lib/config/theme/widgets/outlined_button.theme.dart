import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/borderRadius.config.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
  foregroundColor: AppColors.primaryMaterialState,
  textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: AppBorderRadius,
          side: BorderSide(
              color: AppColors.primaryMaterial, width: AppSizes.small))),
));
