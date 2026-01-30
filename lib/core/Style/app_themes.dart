import 'package:flutter/material.dart';
import 'package:tasky/core/Style/app_colors.dart';
import 'app_fonts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.mainFont,
    scaffoldBackgroundColor: AppColors.black181,
    textTheme: TextTheme(),
  );
  static ThemeData dark = ThemeData(
    fontFamily: AppFonts.mainFont,
    scaffoldBackgroundColor: AppColors.black181,
    textTheme: TextTheme(),
  );
}
