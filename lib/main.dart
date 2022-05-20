import 'package:flutter/material.dart';
import 'May19_2022/fetchDataFromApi/Practice1/fetch_data_homescreen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FetchDataHomeScreen1(),
    );
  }
}
