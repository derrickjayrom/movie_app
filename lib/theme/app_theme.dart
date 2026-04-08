import 'package:flutter/material.dart';

class AppTheme {

  // Light Theme Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color foreground = Color(0xFF0A0A0A);
  static const Color card = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF030213);
  static const Color secondary = Color(0xFFF1F2F6);
  static const Color muted = Color(0xFFECECF0);
  static const Color accent = Color(0xFFE9EBEF);
  static const Color destructive = Color(0xFFD4183D);
  static const Color border = Color(0x1A000000);

  static const Color inputBackground = Color(0xFFF3F3F5);
  static const Color switchBackground = Color(0xFFCBCED4);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkForeground = Color(0xFFF5F5F5);
  static const Color darkCard = Color(0xFF121212);
  static const Color darkSecondary = Color(0xFF2B2B2B);
  static const Color darkMuted = Color(0xFF2B2B2B);
  static const Color darkAccent = Color(0xFF2B2B2B);
  static const Color darkBorder = Color(0xFF2B2B2B);

  // Radius
  static const double radius = 10;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: foreground,
      error: destructive,
      onError: Colors.white,
      // background: background,
      // onBackground: foreground,
      surface: card,
      onSurface: foreground,
      tertiary: background, // Added for bottom nav
    ),

    cardColor: card,

    dividerColor: border,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide.none,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: darkBackground,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: darkSecondary,
      onSecondary: Colors.white,
      error: destructive,
      onError: Colors.white,
      // background: darkBackground,
      // onBackground: darkForeground,
      surface: darkCard,
      onSurface: darkForeground,
      tertiary: darkBackground, // Added for bottom nav
    ),

    cardColor: darkCard,

    dividerColor: darkBorder,
  );
}