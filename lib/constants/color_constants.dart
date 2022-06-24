import 'package:flutter/material.dart';

class GlobalVariable {
  // colors
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  // colors constants
  static const orangeColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800];
  static const unselectedNavBarColor = Colors.black87;
  static const whatsAppBarColor = Color.fromRGBO(18, 140, 126, 1);
}
