import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/June3_2022/Simple_Api_calling/provider_getdata.dart';
import 'June3_2022/Simple_Api_calling/home_screen_6_june_simple_api.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderForGetData(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectCategoryIndex(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
