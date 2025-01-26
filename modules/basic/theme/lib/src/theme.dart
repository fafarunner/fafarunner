import 'package:flutter/material.dart';

/// app theme
class AppTheme {

  /// light mode
  static ThemeData get light {
    return ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      fontFamily: 'Normal',
    );
  }

  /// dark mode
  static ThemeData get dark {
    return ThemeData(
      dialogTheme: const DialogTheme(
        backgroundColor: Colors.black87,
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      fontFamily: 'Normal',
    );
  }
}
