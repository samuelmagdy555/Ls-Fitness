import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes.dart';
import 'package:meta/meta.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<Map<String, dynamic>> {
  ThemesCubit()
      : super({
    'theme': ThemesClass.manDarkTheme, // الوضع الافتراضي: المظلم
    'backgroundImage': 'assets/images/77.jpg'
  });

  // لسهولة الوصول إلى ThemesCubit
  static ThemesCubit get(context) => BlocProvider.of(context);

  // تغيير الـ Theme مع تحديث الصورة الخلفية
  void changeTheme(
      {required ThemeData newTheme, required String newBackgroundImage}) {
    emit({
      'theme': newTheme,
      'backgroundImage': newBackgroundImage,
    });
  }

  // Getter لقراءة الـ Theme الحالي بسهولة
  ThemeData get currentTheme => state['theme'];

  // Getter لقراءة الخلفية الحالية بسهولة
  String get currentBackgroundImage => state['backgroundImage'];
}
