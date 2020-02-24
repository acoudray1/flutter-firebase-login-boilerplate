import 'package:shared_preferences/shared_preferences.dart';

/// [SharedPrefCalls] is a singleton that provides access to shared preferences
class SharedPrefCalls {

  factory SharedPrefCalls() {
    return _singleton;
  }

  SharedPrefCalls._internal();

  static final SharedPrefCalls _singleton = SharedPrefCalls._internal();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// [isDarkMode] returns wether if the theme is dark or not
  Future<bool> isDarkMode() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool('is_dark_mode') ?? false;
  }

  /// [setIsDarkMode] sets the new theme to display
  ///
  /// @param bool isDarkMode : true is for darkMode, false for lightMode
  Future<void> setIsDarkMode(bool isDarkMode) async {
    print('Setting darkmode to: $isDarkMode');
    final SharedPreferences prefs = await _prefs;

    prefs.setBool('is_dark_mode', isDarkMode);
  }
}