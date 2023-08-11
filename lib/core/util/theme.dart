import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData appTheme() {
  return ThemeData(
    //! Background color
    scaffoldBackgroundColor: AppColors.background,
    //! text theme
    textTheme: TextTheme(
      //! Title
      titleLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.white,
      ),
      //! Subtitle
      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.white,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 24,
        color: AppColors.white,
      ),
    ),
    
    //! ElevaredButton 
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        fixedSize: Size(90.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}
