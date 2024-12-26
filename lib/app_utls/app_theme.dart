import 'package:event_planning_app/app_utls/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme:  TextTheme(bodyMedium: TextStyle(
      color: AppColors.black
    )),
    scaffoldBackgroundColor: AppColors.bglight,
    primaryColor: AppColors.primaryColor,
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        shape: StadiumBorder(
          side: BorderSide(
            color: AppColors.white,
            width: 5,

          ),
        ),
      ),
      bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
      ),
  );
  static final ThemeData darkTheme = ThemeData(
      textTheme:  TextTheme(bodyMedium: TextStyle(
          color: AppColors.white
      )),
      scaffoldBackgroundColor: AppColors.primaryColorDark,
      primaryColor: AppColors.primaryColorDark,
      floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        shape: StadiumBorder(
          side: BorderSide(
            color: AppColors.white,
            width: 5,

          ),
        ),
      ),
  bottomNavigationBarTheme:const BottomNavigationBarThemeData(
    elevation: 0,
    showUnselectedLabels: true,
  )

  );

}