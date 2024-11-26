import 'package:flutter/material.dart';

class AppStyle {
  static Color lightPrimaryColor = Colors.white;
  static Color lightOnPrimaryColor = Colors.white;
  static Color lightSecondary = Colors.white;
  static Color lightOnSecondary = Colors.white;
  static Color lightTertiary = Colors.white;
  static Color darkPrimaryColor = Colors.black;
  static Color darkOnPrimaryColor = Colors.black;
  static Color darkSecondary = Colors.black;
  static Color darkOnSecondary = Colors.black;
  static Color darkTertiary = Colors.black;

  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: lightPrimaryColor,
          secondary: lightSecondary,
          onPrimary: lightOnPrimaryColor,
          onSecondary: lightOnSecondary,
          tertiary: lightTertiary));
  static ThemeData darkTheme = ThemeData(
      textTheme: const TextTheme(),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: darkPrimaryColor,
          secondary: darkSecondary,
          onPrimary: darkOnPrimaryColor,
          onSecondary: darkOnSecondary,
          tertiary: darkTertiary));
}
