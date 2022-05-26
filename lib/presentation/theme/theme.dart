import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokechallenge/core/app_colors.dart';

final appLightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.gray50,
    elevation: 0,
  ),
  cardTheme: const CardTheme(
    color: AppColors.gray50,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    elevation: 0,
  ),
  scaffoldBackgroundColor: AppColors.gray50,
  backgroundColor: AppColors.white100,
  dividerColor: AppColors.gray90,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.bold,
      fontSize: 34,
    ),
    headline5: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w400,
      fontSize: 28,
    ),
    headline1: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    headline2: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    subtitle2: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    bodyText1: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyText2: TextStyle(
      color: AppColors.black100,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
  ),
);

final appDarkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.black60,
    elevation: 0,
  ),
  cardTheme: const CardTheme(
    color: AppColors.black60,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    elevation: 0,
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.black60,
  backgroundColor: AppColors.black80,
  dividerColor: AppColors.gray70,
  textTheme: const TextTheme(
    headline6: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.bold,
      fontSize: 34,
    ),
    headline5: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w400,
      fontSize: 28,
    ),
    headline1: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
    headline2: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    subtitle2: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    bodyText1: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w500,
      fontSize: 17,
    ),
    bodyText2: TextStyle(
      color: AppColors.white100,
      fontWeight: FontWeight.w400,
      fontSize: 17,
    ),
  ),
);
