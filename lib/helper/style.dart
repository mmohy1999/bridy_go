import 'package:flutter/material.dart';
import '../constants/my_colors.dart';

ThemeData uiTheme() {
  return ThemeData(
    unselectedWidgetColor: Colors.grey[500],
    fontFamily: 'Poppins',
    tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(size: 13, color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
    dividerColor: backgroundColor,
    primaryColor: primaryColor,
    backgroundColor: const Color(0xffEBF3F9),
    textTheme: const TextTheme(
        button: TextStyle(color: Colors.white),
        bodyText1: TextStyle(
          color: Color(0xff4d4d4d),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          color: Color(0xffb3b3b3),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(color: Colors.white, fontSize: 20),
        subtitle1: TextStyle(color: Colors.white)), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
