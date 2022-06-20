import 'package:flutter/material.dart';

var appTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: const TextTheme(
    headline3: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w500,
      color: Color(0xff3d3d3d),
      fontSize: 36,
    ),
    subtitle1: TextStyle(
      fontFamily: 'Gilroy',
      color: Color(0xff868686),
      fontWeight: FontWeight.w800,
      fontSize: 13,
    ),
    button: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w500,
      fontSize: 28,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xffc93033),
      ),
    ),
  ),
);

var temptheme = ThemeData();
