
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/button.dart';
import 'package:provider/provider.dart';
import 'June3_2022/Simple_Api_calling_and_provider/provider_getdata.dart';

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
      home: CalculatorButtonDesign(),
    );
  }
}
