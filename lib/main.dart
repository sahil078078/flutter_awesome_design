import 'package:flutter/material.dart';

import 'May20_2022/ApiGetPostDelete/api_get_post_delete_homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiGetPostDeleteHomeScreen(),
    );
  }
}
