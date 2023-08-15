import 'package:flutter/material.dart';
import 'package:x_clone/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Pallete.blueColor,
      onPrimary: Pallete.backgroundColor,
    ),
  );
}
