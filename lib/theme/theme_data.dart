import 'package:flutter/material.dart';
import 'package:shodia_mama/utils/constrants.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
  );
}
