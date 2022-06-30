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
    bodyText2: TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(61, 61, 61, 1),
      fontSize: 12,
    ),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Color(0xff3d3d3d),
    ),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: 'Gilroy-Bold',
      fontWeight: FontWeight.w900,
      color: Color(0xff3d3d3d),
      fontSize: 22,
    ),
    toolbarHeight: 80,
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
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    isDense: true,
    fillColor: Color(0xffeae0d6),
  ),
);

var temptheme = ThemeData();
