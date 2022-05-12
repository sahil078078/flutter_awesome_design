import 'package:flutter/material.dart';
import 'May12_2022/Flutter_Downloader/download_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterDownloaderHomeScreen(),
    );
  }
}
