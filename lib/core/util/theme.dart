import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData appDarkTheme() {
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

    //! TextField
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.background,
      hintStyle: TextStyle(
        color: AppColors.white,
      ),
      suffixIconColor: AppColors.white,              
    ),

    //! AppBar
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      titleTextStyle: TextStyle(),
    ),
    // iconTheme: const IconThemeData(
    //   color: AppColors.white,
    // ),
  );
}

ThemeData appLightTheme() {
  return ThemeData(
    //! Background color
    scaffoldBackgroundColor: AppColors.white,
    //! text theme
    textTheme: TextTheme(
      //! Title
      titleLarge: GoogleFonts.lato(
        fontSize: 32,
        color: AppColors.background,
      ),
      //! Subtitle
      titleMedium: GoogleFonts.lato(
        fontSize: 16,
        color: AppColors.background,
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 24,
        color: AppColors.background,
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

    //! TextField
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.white,
      hintStyle: TextStyle(
        color: AppColors.background,
      ),
      suffixIconColor: AppColors.background,
    ),

    //! AppBar
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      iconTheme: IconThemeData(
        color: AppColors.background,
      ),
      titleTextStyle: TextStyle(),
    ),
  );
}
