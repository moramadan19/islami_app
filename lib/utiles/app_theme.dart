import 'package:flutter/material.dart';
import 'package:islami_app/utiles/app_styles.dart';
import 'package:islami_app/utiles/islamiColors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Islamicolors().transparent,
    // canvasColor: Islamicolors().gold
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black
    ),
    textTheme: TextTheme(
      headlineMedium: AppStyles.bold16white
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Islamicolors().blackBg,

        centerTitle: true,
        iconTheme: IconThemeData(
            color: Islamicolors().gold
        )
    )
  );

}