import 'package:flutter/material.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';

class AppSnackBar {
  static void showDefault(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.primary,
      content: Center(
        child: Text(
          message,
          style: TextStyle(fontWeight: AppFontWeight.bold),
        ),
      ),
    ));
  }

  static void showError(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.textErrorColor,
      content: Center(
        child: Text(
          message,
          style: TextStyle(fontWeight: AppFontWeight.bold),
        ),
      ),
    ));
  }
}
