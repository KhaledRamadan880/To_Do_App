import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData AppTheme() {
  return ThemeData(
    // background color
    scaffoldBackgroundColor: AppColors.background,
    // text theme
    textTheme: TextTheme(
      // title
      titleLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.white,
      ),
      // subtitle
      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 24,
        color: AppColors.white,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        fixedSize: const Size(90, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
