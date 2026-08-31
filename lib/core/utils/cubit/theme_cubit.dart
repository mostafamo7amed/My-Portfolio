import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'user_theme_mode';

  ThemeCubit() : super(ThemeMode.dark) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedTheme = prefs.getString(_themeKey);
      if (savedTheme == 'light') {
        emit(ThemeMode.light);
      } else {
        emit(ThemeMode.dark);
      }
    } catch (_) {}
  }

  Future<void> toggleTheme() async {
    final nextMode =
        state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(nextMode);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          _themeKey, nextMode == ThemeMode.light ? 'light' : 'dark');
    } catch (_) {}
  }
}
