import 'package:flutter/material.dart';
import 'June3_2022/Simple_Api_calling/home_screen_6_june_simple_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen6JuneSimpleAPICalling(),
    );
  }
}
