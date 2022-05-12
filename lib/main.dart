import 'package:flutter/material.dart';
import 'May12_2022/Swipable_button_view/home_screen_button3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen2Btn2(),
    );
  }
}
