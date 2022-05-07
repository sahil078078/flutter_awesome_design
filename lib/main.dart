import 'package:flutter/material.dart';

import 'May6_2022/SignInButtonFromDiffrentSocialMedia/SignInButton_6May_1/home_screen_button1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen1Btn1(),
    );
  }
}
