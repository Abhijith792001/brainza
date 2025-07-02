import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0XFF332388);
  static const Color accentColor = Color(0XFF4EE3C1);
  static const Color secondaryColor = Color(0XFFe5deff);
  static const Color secondaryLightColor = Color(0XFFF7F5FA);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color grayColor = Color(0xff737373);
    static const Color shadowColor = Color(0xFFCAC9C9);


  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF332388), Color(0xFF433498), Color(0xFF5748A3)],
    stops: [0.0, 0.5, 1.0], // Optional: controls transition smoothness
  );

  static const List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 0),
                spreadRadius: 0,
    )
  ];

}
