import 'package:flutter/material.dart';
import 'package:hotels_app/core/values/app_colors.dart';

abstract class AppTextTheme {
  static TextStyle titleTextStyle = TextStyle(
    color: AppColors.primary,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle contentTextStyle = TextStyle(
    color: AppColors.primary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
