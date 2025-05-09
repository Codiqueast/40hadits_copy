import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppTheme {
  static final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.teal)
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.teal)
  );

}
