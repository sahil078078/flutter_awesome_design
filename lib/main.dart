import 'package:flutter/material.dart';
import 'May14_2022/CustomPainter/custom_paint_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomPaintHomeScreen(),
    );
  }
}
