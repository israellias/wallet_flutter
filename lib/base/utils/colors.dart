import 'package:flutter/material.dart';

class AppColor {
  static const int _primaryValue = 0xFF4953CF;
  static const indigo = Color(_primaryValue);
  static const whiteBlue = Color(0xFF3898EC);
  static const red = Color(0xFFEA384C);
  static const gray1 = Color(0xFF758696);
  static const gray2 = Color(0xFFCCCCCC);
  static const white = Color(0xFFFFFFFF);


  // Utilities
  static const titleColor = Color(0xFF191B22);
  static const textColor = Color(0xFF08090A);
  static const secondaryTextColor = Color(0xFF546285);
  static const linkColor = Color(0xFF35B8BE);
  static const background = Color(0xFFF5FBFC);

  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFCCCFFF),
      100: Color(0xFFAAAEF2),
      200: Color(0xFF747CE8),
      300: Color(0xFF6770E6),
      400: Color(0xFF575FD9),
      500: Color(_primaryValue),
      600: Color(0xFF3D46BF),
      700: Color(0xFF2932A6),
      800: Color(0xFF1C248C),
      900: Color(0xFF1E1380),
    },
  );
}
