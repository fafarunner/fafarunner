import 'package:flutter/material.dart';

import 'package:theme/theme.dart';

/// app theme
class AppTheme {

  /// light mode
  static ThemeData get light {
    return ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: FRColors.primaryTextColor),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: FRColors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color(0xFF13B9FF),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: FRColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: FRColors.white),
      ),
      dialogTheme: const DialogThemeData(
        backgroundColor: FRColors.dialogBackgroundColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF13B9FF),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color(0xFF13B9FF),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        surfaceTintColor: FRColors.dialogBackgroundColor,
        backgroundColor: FRColors.dialogBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      fontFamily: 'Normal',
    );
  }
}
