import 'package:flutter/material.dart';
import 'package:math_quizz_app/resources/constants/app_textstyles.dart';
import 'app_colors.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: 'Roboto',
      // Define the text theme for the entire app
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.bodyText,
        bodySmall: AppTextStyles.buttonText,
      ),



      // Define the style for text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundColor,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        errorStyle: AppTextStyles.errorText,
      ),

      // Define the default style for app bars
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 4.0,
        titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // Define the style for bottom navigation bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.bodyText,
        unselectedLabelStyle: AppTextStyles.bodyTextSecondary,
      ),

      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primaryColor,
        contentTextStyle: AppTextStyles.bodyText.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
