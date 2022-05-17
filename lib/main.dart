import 'package:flutter/material.dart';
import 'May17_2022/DownloadAndStoreInLocalMemory/download_store_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoanloadAndStoreHomeScree(),
    );
  }
}
