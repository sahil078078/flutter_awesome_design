import 'package:flutter/material.dart';
import 'May19_2022/RefreshIndicatorWidget/refresh_indicator_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RefreshIndicatorHomeScreen(),
    );
  }
}
