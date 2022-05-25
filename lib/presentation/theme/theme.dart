import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';

final appLightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.gray50,
  ),
  scaffoldBackgroundColor: AppColors.white100,
  textTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.bold,
      fontSize: 34,
    ),
  ),
);

final appDarkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black60,
  ),
  scaffoldBackgroundColor: AppColors.black80,
  textTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.bold,
      fontSize: 34,
    ),
  ),
);
