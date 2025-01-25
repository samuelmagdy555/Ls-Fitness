import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Core/Themes/Themes.dart';
import 'package:meta/meta.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<Map<String, dynamic>> {
  ThemesCubit() : super({'theme': ThemesClass.manDarkTheme, 'backgroundImage': 'assets/images/77.jpg'});

  static ThemesCubit get(context) => BlocProvider.of(context);
}
