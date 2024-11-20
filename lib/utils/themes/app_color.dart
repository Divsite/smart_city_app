import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color bottomNavigation = Color(0xFF1C1C1C);
  static const Color dark = Color(0XFF3C3C3C);
  static const Color semiDark = Color(0xFF616161);
  static const Color gray = Color(0xFFB9B9C3);
  static const Color blue = Color(0xFF3FA1BC);

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
    50: Color(0xFFFEF8E2),
    100: Color(0xFFFBEFB6),
    200: Color(0xFFF9E485),
    300: Color(0xFFF7D954),
    400: Color(0xFFF5D02F),
    500: Color(_primaryPrimaryValue),
    600: Color(0xFFF1C209),
    700: Color(0xFFEFBB07),
    800: Color(0xFFEDB405),
    900: Color(0xFFEAA703),
  });
  static const int _primaryPrimaryValue = 0xFF1E88E5;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_primaryAccentValue),
    400: Color(0xFFFFE4AB),
    700: Color(0xFFFFDB91),
  });
  static const int _primaryAccentValue = 0xFFFFF4DE;
}
