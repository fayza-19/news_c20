import 'package:flutter/material.dart';

import '../../core/colorsmanager/colorsmanager.dart';

class ThemeManager{
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor:  ColorsManager.black,
      appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: ColorsManager.black,
          centerTitle: true,
          titleTextStyle: TextStyle(color: ColorsManager.white, fontSize: 20, fontWeight: FontWeight.w500)
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        indicatorColor: ColorsManager.white,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ColorsManager.white),
        unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorsManager.white),
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: ColorsManager.white)
      )
  );
  static ThemeData dark = ThemeData();
}