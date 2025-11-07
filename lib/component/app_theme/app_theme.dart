import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.montserratTextTheme(
        const TextTheme(
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // Optional: Add dark theme
  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      // Customize dark theme colors here
    );
  }
}