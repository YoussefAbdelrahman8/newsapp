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
      inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: lightPrimaryColor,
          suffixIconColor: lightPrimaryColor,
          fillColor: lightOnPrimaryColor,
          filled: true,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: lightPrimaryColor.withOpacity(28 / 100)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent))),
      scaffoldBackgroundColor: Colors.transparent,
      tabBarTheme: TabBarTheme(
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        tabAlignment: TabAlignment.start,
        labelColor: lightOnPrimaryColor,
        dividerHeight: 0,
        unselectedLabelColor: lightPrimaryColor,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: lightPrimaryColor, width: 1),
          color: lightPrimaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: lightOnPrimaryColor,
          size: 30,
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 22,
          color: lightOnPrimaryColor,
        ),
        color: lightPrimaryColor,
        toolbarHeight: 67,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xFF42505C),
        ),
        titleSmall: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Color(0xFF79828B),
        ),
        labelSmall: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
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
