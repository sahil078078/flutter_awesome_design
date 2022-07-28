import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_button_design.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/custom_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/calculator_controller.dart';
import 'components/calculator_provider.dart';
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
    bool isDark =
        Provider.of<CalculatorProvider>(context, listen: true).isDarkMode;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xff595959) : Colors.white,
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
                color: isDark
                    ? const Color.fromARGB(255, 220, 230, 233)
                    : Colors.white,
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
                children: [
                  CalculatorButtonDesign(
                    buttonName: '7',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '8',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '9',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  const CalculatorButtonDesign(buttonName: 'x'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButtonDesign(
                    buttonName: '4',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '5',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '6',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  const CalculatorButtonDesign(
                    buttonName: '-',
                    textSize: 36,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButtonDesign(
                    buttonName: '1',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '2',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '3',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  const CalculatorButtonDesign(buttonName: '+'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.023,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculatorButtonDesign(
                    buttonName: '0',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  CalculatorButtonDesign(
                    buttonName: '.',
                    textStyle: buttonTextStyle(isDark: isDark),
                  ),
                  const CalculatorButtonDesign(
                    buttonName: 'DEL',
                    textSize: 15.5,
                  ),
                  const CalculatorButtonDesign(buttonName: '='),
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

TextStyle buttonTextStyle({required bool isDark}) {
  return GoogleFonts.montserrat(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: isDark ? Colors.white : Colors.black.withOpacity(0.52),
  );
}
