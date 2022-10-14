import 'package:flutter/material.dart';

class LightTheme {
  final _LightColor _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      textTheme: ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 14, color: _lightColor.textColor)),
      buttonTheme: ButtonThemeData(colorScheme: ColorScheme.light(onPrimary: _lightColor.greenLaceweek)),
      colorScheme: const ColorScheme.light(),
      checkboxTheme: const CheckboxThemeData(side: BorderSide(), fillColor: MaterialStatePropertyAll(Colors.green)),
      scaffoldBackgroundColor: Colors.white70.withOpacity(0.9),
      appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)))),
    );
  }
}

class _LightColor {
  final Color textColor = const Color.fromARGB(255, 66, 16, 13);
  final Color greenLaceweek = const Color.fromARGB(141, 211, 115, 1);
}
