import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Style for large headings or titles
  static const TextStyle heading1 = TextStyle(
    fontFamily: 'Quicksand',
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Style for smaller headings or section titles
  static const TextStyle heading2 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Style for regular body text
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.normal,
  );

  // Style for secondary text or descriptions
  static const TextStyle bodyTextSecondary = TextStyle(
    fontSize: 14.0,
    color: AppColors.textSecondary,
    fontWeight: FontWeight.normal,
  );

  // Style for buttons or actionable items
  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  // Error text style (for validation errors, incorrect answers, etc.)
  static const TextStyle errorText = TextStyle(
    fontSize: 14.0,
    color: AppColors.errorColor,
    fontWeight: FontWeight.bold,
  );

  // Style for success messages or feedback
  static const TextStyle successText = TextStyle(
    fontSize: 14.0,
    color: AppColors.successColor,
    fontWeight: FontWeight.bold,
  );
}
