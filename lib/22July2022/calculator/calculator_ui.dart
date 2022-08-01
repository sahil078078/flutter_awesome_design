import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_button_design.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/custom_appbar.dart';
import 'package:flutter_awesome_design/22July2022/calculator/helper_function/is_num_double.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'components/calculator_controller.dart';
import 'components/calculator_provider.dart';
import 'helper_function/button_text_style.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String inputValue = '';
  double? num1, num2, result;
  String? button;
  String? displayText;
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
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
              margin: EdgeInsets.only(bottom: size.height * 0.015),
              width: size.width,
              height: size.height * 0.142,
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
              child: Text(
                inputValue.isNotEmpty
                    ? (inputValue.length < 37
                        ? inputValue
                        : inputValue.substring(0, 36))
                    : '0',
                // we controle maxLengh upto 36 character only
                overflow: TextOverflow.clip,
                style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: size.height * 0.045,
                ),
                maxLines: 2,
              ),
            ),
            const CalculatorController(),
            // SizedBox(height: size.height * 0.03),
            const Spacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButtonDesign(
                  buttonName: 'AC',
                  onPressed: () {
                    setState(() {
                      inputValue = '';
                      displayText = inputValue;
                    });
                  },
                ),
                CalculatorButtonDesign(
                  buttonName: '+/-',
                  onPressed: () {
                    setState(() {
                      // inputValue = '${double.parse(inputValue) * (-1)}';
                      // above code work fine but 1=>1.0 given and that i don't want

                      if (isDoubleNum(number: double.parse(inputValue))) {
                        inputValue = '${double.parse(inputValue) * (-1)}';
                      } else {
                        inputValue = '${int.parse(inputValue) * (-1)}';
                      }

                      displayText = inputValue;
                    });

                    log('nagative : $inputValue');
                  },
                ),
                CalculatorButtonDesign(
                  buttonName: '%',
                  onPressed: () {
                    setState(() {
                      inputValue = "${double.parse(inputValue) * 0.01}";
                      displayText = inputValue;
                    });
                  },
                ),
                CalculatorButtonDesign(
                  buttonName: '/',
                  onPressed: () => calculatorLogic(buttonName: '/'),
                ),
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
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '7';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '8',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '8';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '9',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '9';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: 'x',
                    onPressed: () => calculatorLogic(buttonName: 'x'),
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
                    buttonName: '4',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '4';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '5',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '5';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '6',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '6';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '-',
                    textSize: 36,
                    onPressed: () => calculatorLogic(buttonName: '-'),
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
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '1';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '2',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '2';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '3',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '3';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '+',
                    onPressed: () => calculatorLogic(buttonName: '+'),
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
                    buttonName: '0',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue + '0';
                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '.',
                    textStyle: buttonTextStyle(isDark: isDark),
                    onPressed: () {
                      if (!inputValue.contains('.')) {
                        setState(() {
                          inputValue = inputValue + '.';
                          displayText = inputValue;
                        });
                      }
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: 'DEL',
                    textSize: 15.5,
                    onPressed: () {
                      setState(() {
                        inputValue = inputValue.substring(
                          0,
                          inputValue.length - 1 > 0 ? inputValue.length - 1 : 0,
                        );

                        displayText = inputValue;
                      });
                    },
                  ),
                  CalculatorButtonDesign(
                    buttonName: '=',
                    onPressed: () => calculatorLogic(buttonName: '='),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  void calculatorLogic({required String buttonName}) {
    if (buttonName == 'x' ||
        buttonName == '+' ||
        buttonName == '-' ||
        buttonName == '/') {
      setState(() {
        if (inputValue.isNotEmpty) {
          num1 = double.parse(inputValue);
          button = buttonName;
          inputValue = '';
          buttonName = '';
        }
      });
      log('firstString : $num1');
      log('afterStringValue type and length : ${inputValue.runtimeType} : ${inputValue.length}');
    }
    log('buttonName : $buttonName');

    try {
      if (buttonName == '=' && buttonName.isNotEmpty && inputValue.isNotEmpty) {
        setState(() {
          num2 = double.parse(inputValue);
          buttonName = '';
        });
        log('buttonName : $buttonName');
        log('button : $button');
        if (button == 'x') {
          result = num1! * num2!;
          setState(() {
            inputValue =
                '${isDoubleNum(number: result!) ? result : result!.round()}';
            button = '';
            displayText = "$displayText" + inputValue;
          });
        } else if (button == '+') {
          result = num1! + num2!;
          setState(() {
            inputValue =
                '${isDoubleNum(number: result!) ? result : result!.round()}';
            button = '';
            displayText = "$displayText" + inputValue;
          });
        } else if (button == "-") {
          result = num1! - num2!;
          setState(() {
            inputValue =
                '${isDoubleNum(number: result!) ? result : result!.round()}';
            button = '';
            displayText = "$displayText" + inputValue;
          });
        } else if (button == '/') {
          try {
            result = num1! / num2!;
            setState(() {
              inputValue =
                  '${isDoubleNum(number: result!) ? result : result!.round()}';
              button = '';
              displayText = "$displayText" + inputValue;
            });
          } catch (e) {
            throw const Text('can\'t divide by zero');
          }
        }

        log('num1 : $num1');
        log('num2 : $num2');
        log('button : $button');
      }
    } catch (e) {
      throw Text('$e');
    }
  }
}
