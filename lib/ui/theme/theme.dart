import 'dart:io';
import 'package:gde_namaz/components/components.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: HexColors.white,
  ),
  iconTheme: IconThemeData(color: HexColors.black),
  scaffoldBackgroundColor: HexColors.white,
  primaryColor: HexColors.primary,
  primaryColorLight: HexColors.greenLightGradient,
  primaryColorDark: HexColors.greenDarkGradient,
  focusColor: HexColors.primary,
  hoverColor: HexColors.blur,
  cardColor: HexColors.card,
  dividerColor: HexColors.divider,
  disabledColor: HexColors.red,
  dialogBackgroundColor: HexColors.white,
  splashColor: HexColors.grey,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: HexColors.white,
    selectionHandleColor: HexColors.primary,
    selectionColor: HexColors.primary,
  ),
  splashFactory: Platform.isMacOS || Platform.isIOS
      ? NoSplash.splashFactory
      : InkSparkle.splashFactory,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: HexColors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: HexColors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: HexColors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: HexColors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: HexColors.black,
    ),
  ),
);

final darkTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: HexColors.darkGrey,
  ),
  iconTheme: IconThemeData(color: HexColors.white),
  scaffoldBackgroundColor: HexColors.darkGrey,
  primaryColor: HexColors.primary,
  primaryColorLight: HexColors.greenLightGradient,
  primaryColorDark: HexColors.greenDarkGradient,
  focusColor: HexColors.primary,
  hoverColor: HexColors.blur,
  cardColor: HexColors.black,
  dividerColor: HexColors.darkGrey,
  disabledColor: HexColors.red,
  dialogBackgroundColor: HexColors.darkGrey,
  splashColor: HexColors.grey,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: HexColors.white,
    selectionHandleColor: HexColors.primary,
    selectionColor: HexColors.primary,
  ),
  splashFactory: Platform.isMacOS || Platform.isIOS
      ? NoSplash.splashFactory
      : InkSparkle.splashFactory,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      color: HexColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: HexColors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: HexColors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: HexColors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: HexColors.white,
    ),
  ),
);
