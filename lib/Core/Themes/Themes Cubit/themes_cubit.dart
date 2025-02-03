import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes.dart';

import '../../DataBase/Local_database/cach_helper.dart';

class ThemesCubit extends Cubit<Map<String, dynamic>> {
  static const String KEY_IS_MAN = 'isMan';
  static const String KEY_IS_DARK = 'isDark';
  static const String KEY_BACKGROUND = 'backgroundImage';

  ThemesCubit()
      : super({
    'theme': ThemesClass.manDarkTheme,
    'backgroundImage': 'assets/images/77.jpg',
    'isMan': true,
    'isDark': true,
  }) {
  }

  Future<void> initTheme() async {
    final bool isMan = await CashHelper.getBoolFromCash(key: KEY_IS_MAN) ?? true;
    final bool isDark = await CashHelper.getBoolFromCash(key: KEY_IS_DARK) ?? true;
    final String backgroundImage =
        await CashHelper.getFromCash(key: KEY_BACKGROUND) ?? 'assets/images/77.jpg';

    ThemeData theme;
    if (isMan) {
      theme = isDark ? ThemesClass.manDarkTheme : ThemesClass.manLightTheme;
    } else {
      theme = isDark ? ThemesClass.WomanDarkTheme : ThemesClass.WomanLightTheme;
    }

    emit({
      'theme': theme,
      'backgroundImage': backgroundImage,
      'isMan': isMan,
      'isDark': isDark,
    });
  }

  Future<void> _saveSettings({
    required bool isMan,
    required bool isDark,
    required String backgroundImage,
  }) async {
    await CashHelper.insertBoolToCash(key: KEY_IS_MAN, value: isMan);
    await CashHelper.insertBoolToCash(key: KEY_IS_DARK, value: isDark);
    await CashHelper.insertToCash(key: KEY_BACKGROUND, value: backgroundImage);
  }

  static ThemesCubit get(context) => BlocProvider.of(context);


  Future<void> toggleDarkMode() async {
    final bool newIsDark = !state['isDark'];
    final bool isMan = state['isMan'];
    String newBackgroundImage;

    ThemeData newTheme;
    if (isMan) {
      newTheme = newIsDark ? ThemesClass.manDarkTheme : ThemesClass.manLightTheme;
      newBackgroundImage = newIsDark ? 'assets/images/77.jpg' : 'assets/images/7.jpg';
    } else {
      newTheme = newIsDark ? ThemesClass.WomanDarkTheme : ThemesClass.WomanLightTheme;
      newBackgroundImage = newIsDark ? 'assets/images/11.jpg' : 'assets/images/1.jpg';
    }

    emit({
      'theme': newTheme,
      'backgroundImage': newBackgroundImage,
      'isMan': isMan,
      'isDark': newIsDark,
    });

    await _saveSettings(
      isMan: isMan,
      isDark: newIsDark,
      backgroundImage: newBackgroundImage,
    );
  }
  // Getters
  ThemeData get currentTheme => state['theme'];
  String get currentBackgroundImage => state['backgroundImage'];
  bool get isMan => state['isMan'];
  bool get isDark => state['isDark'];
}