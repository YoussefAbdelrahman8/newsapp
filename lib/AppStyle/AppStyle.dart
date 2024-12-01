import 'package:flutter/material.dart';

class AppStyle {
  static Color lightPrimaryColor = const Color(0xFF39A552);
  static Color lightOnPrimaryColor = Colors.white;
  static Color lightSecondary = const Color(0xFF303030);
  static Color lightOnSecondary = Colors.white;
  static Color lightTertiary = const Color(0xFF4F5A69);
  static Color darkPrimaryColor = Colors.black;
  static Color darkOnPrimaryColor = Colors.black;
  static Color darkSecondary = Colors.black;
  static Color darkOnSecondary = Colors.black;
  static Color darkTertiary = Colors.black;

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        color: lightPrimaryColor,
        toolbarHeight: 67,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      textTheme: TextTheme(
        labelMedium: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
          color: lightOnPrimaryColor,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: lightOnPrimaryColor,
        ),
        labelLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
          color: lightTertiary,
        ),
      ),
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
