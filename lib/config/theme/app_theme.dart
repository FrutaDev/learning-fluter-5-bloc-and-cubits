import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    final Color seedColor = Colors.deepPurple;
    return ThemeData(
      colorSchemeSeed: seedColor,
      listTileTheme: ListTileThemeData(
        iconColor: seedColor
      ),
    );
  }
}