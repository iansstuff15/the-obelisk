import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/colors.config.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  fillColor: AppColors.textBox,
  filled: true,
  border: InputBorder.none,
  labelStyle: GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
  ),
  hintStyle: GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w200,
      fontSize: 12,
    ),
  ),
);
