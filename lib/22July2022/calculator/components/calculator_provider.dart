import 'package:flutter/cupertino.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_sharedpref.dart';

class CalculatorProvider extends ChangeNotifier {
  bool isButtonSound = sharedPref.isSound;
  bool isDarkMode = sharedPref.isDark;

  buttonSoundSetting({required bool isSound}) {
    isButtonSound = isSound;
    sharedPref.isSound = isButtonSound;
    notifyListeners();
  }

  darkModeSetting({required bool isDark}) {
    isDarkMode = isDark;
    sharedPref.isDark = isDarkMode;
    notifyListeners();
  }
}
