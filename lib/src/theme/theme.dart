import 'package:flutter/material.dart';

class ThemeApp {
  // Colors for default theme
  static const Color primaryBlueColor = Color(0xff003566);
  static const Color secondaryBlueColor = Color(0xff56AFDE);
  static const Color primaryYellowColor = Color(0xffFFCD05);
  static const Color secondaryYellowColor = Color(0xffFFC300);
  static const Color complementaryColor = Color(0xffA08E27);
  static const Color lightBlueColor = Color(0xffB6D4E7);
  

  static final ThemeData customLightTheme = ThemeData.light().copyWith(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      
    )
  );

}