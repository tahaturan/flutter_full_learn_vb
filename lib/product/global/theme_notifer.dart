import 'package:flutter/material.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLighTheme = false;

  void chanceTheme() {
    isLighTheme = !isLighTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLighTheme ? ThemeData.light() : ThemeData.dark();
}
