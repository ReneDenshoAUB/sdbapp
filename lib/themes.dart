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
    headline4: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w500,
      color: Color(0xff3d3d3d),
      fontSize: 30,
    ),
    headline5: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w500,
      color: Color(0xff3d3d3d),
      fontSize: 25,
    ),
    headline6: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w500,
      color: Color(0xff3d3d3d),
      fontSize: 16,
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
    bodyText1: TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(61, 61, 61, 1),
      fontSize: 14,
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
