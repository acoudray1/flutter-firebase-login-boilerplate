import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeNotifier(this._themeData);

  ThemeData _themeData;

  ThemeData getTheme() => _themeData;

  bool isDarkMode() => _themeData == buildDarkTheme();

  Future<void> setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

/// [buildDarkTheme] a basic dark theme
ThemeData buildDarkTheme() {
  const Color primaryColor = Colors.deepPurple;
  const Color secondaryColor = Colors.deepPurpleAccent;
  const Color accentColor = Color(0xFFffb300);

  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    textSelectionColor: Colors.white,
    cursorColor: Colors.grey.shade900,
    cardColor: Colors.grey.shade700,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    backgroundColor: primaryColor,
    buttonColor: secondaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.grey.shade900,
    errorColor: const Color(0xFFB00020),
    bottomAppBarColor: Colors.grey.shade700,
    splashColor: accentColor,
  );
  return base;
}

/// [buildLightTheme] a basic light theme
ThemeData buildLightTheme() {
  const Color primaryColor = Colors.indigoAccent;
  const Color secondaryColor = Colors.blueAccent;
  const Color accentColor = Colors.pinkAccent;

  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    textSelectionColor: Colors.grey.shade700,
    cursorColor: Colors.white,
    cardColor: Colors.white,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor,
    backgroundColor: primaryColor,
    buttonColor: secondaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    bottomAppBarColor: Colors.white,
    splashColor: accentColor,
  );
  return base;
}