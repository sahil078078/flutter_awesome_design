import 'package:flutter/material.dart';
import 'May13_2022/HeartApp/neumorphism_button2_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NeuMorphismBtn2HomeScreen(),
    );
  }
}
