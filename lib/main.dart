import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May25_2022/GetDataFromAPI_GoogleSheet/getdata_from_api_google_sheet_homescreen.dart';
import 'May26_2022/LanguageChange/lang_change_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetDataFromGoogleSheet(),
    );
  }
}
