import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_button_design.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_provider.dart';
import 'package:provider/provider.dart';
import '22July2022/calculator/calculator_ui.dart';
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
        ),
        ChangeNotifierProvider<CalculatorProvider>(
          create: (context) => CalculatorProvider(),
        ),
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
      home: CalculatorUI(),
    );
  }
}
