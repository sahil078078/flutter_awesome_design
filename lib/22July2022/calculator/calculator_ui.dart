import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_button_design.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/custom_appbar.dart';

import 'components/calculator_controller.dart';
import 'components/calculator_sharedpref.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      // befor start app we initialize sharedPred object
      sharedPref.init(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 13,
          right: 13,
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: size.width,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 0.85,
                ),
              ),
            ),
            const CalculatorController(),
            const SizedBox(height: 20),
            const CalculatorButtonDesign(),
          ],
        ),
      ),
    );
  }
}
