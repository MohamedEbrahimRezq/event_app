import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light,
    )
  );
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark,
      )


  );

}