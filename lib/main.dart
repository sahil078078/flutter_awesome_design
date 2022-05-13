import 'package:flutter/material.dart';
import 'May13_2022/NeumorphismButton/neumorphism_button1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NeuMorphismBtn1(title: 'Neumorphism Button'),
    );
  }
}
