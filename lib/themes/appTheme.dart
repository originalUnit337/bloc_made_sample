import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
      canvasColor: Colors.green[100],
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),
      canvasColor: Colors.green[900],
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
