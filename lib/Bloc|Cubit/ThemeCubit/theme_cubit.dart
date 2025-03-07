import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../Themes/default_theme.dart';
import '../../Themes/earthy_theme.dart';
import '../../Themes/light_theme.dart';
import '../../Themes/ocean_breeze_theme.dart';
import '../../Themes/pastel_theme.dart';
import '../../Themes/theme_dark.dart';
import '../../Themes/vintageRetro_theme.dart';

final themeMap = {
  'default': defaultTheme,
  'light': lightTheme,
  'dark': darkTheme,
  'pastel': pastelTheme,
  'vintage': vintageRetroTheme,
  'earthy': earthyTheme,
  'ocean': oceanBreezeTheme,
};

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(defaultTheme);

  void selectTheme(String themeName) {
    emit(themeMap[themeName] ?? defaultTheme);
  }
}
