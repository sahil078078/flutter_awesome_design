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
          left: 15,
          right: 15,
          bottom: 10,
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: size.height * 0.015),
              width: size.width,
              height: size.height * 0.135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withOpacity(0.2),
                  width: 0.85,
                ),
              ),
            ),
            const CalculatorController(),
            // SizedBox(height: size.height * 0.03),
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CalculatorButtonDesign(buttonName: 'AC'),
                CalculatorButtonDesign(buttonName: '+/-'),
                CalculatorButtonDesign(buttonName: '%'),
                CalculatorButtonDesign(buttonName: '/'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CalculatorButtonDesign(buttonName: '7'),
                  CalculatorButtonDesign(buttonName: '8'),
                  CalculatorButtonDesign(buttonName: '9'),
                  CalculatorButtonDesign(buttonName: 'x'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CalculatorButtonDesign(buttonName: '4'),
                  CalculatorButtonDesign(buttonName: '5'),
                  CalculatorButtonDesign(buttonName: '6'),
                  CalculatorButtonDesign(buttonName: '-'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CalculatorButtonDesign(buttonName: '1'),
                  CalculatorButtonDesign(buttonName: '2'),
                  CalculatorButtonDesign(buttonName: '3'),
                  CalculatorButtonDesign(buttonName: '+'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CalculatorButtonDesign(buttonName: '0'),
                  CalculatorButtonDesign(buttonName: '.'),
                  CalculatorButtonDesign(buttonName: '3'),
                  CalculatorButtonDesign(buttonName: 'DEL'),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
