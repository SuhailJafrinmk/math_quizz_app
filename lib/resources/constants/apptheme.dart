import 'package:flutter/material.dart';
import 'package:math_quizz_app/resources/constants/app_textstyles.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.bodyText,
        bodySmall: AppTextStyles.buttonText,
      ),
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
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        errorStyle: AppTextStyles.errorText,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 4.0,
        titleTextStyle: AppTextStyles.heading1.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.bodyText,
        unselectedLabelStyle: AppTextStyles.bodyTextSecondary,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primaryColor,
        contentTextStyle: AppTextStyles.bodyText.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
