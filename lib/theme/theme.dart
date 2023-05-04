import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
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

  static ThemeData get dark {
    return ThemeData(
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
