import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _prefs;
  
   init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // getter
  bool get isSound => _prefs!.getBool('soundKey') ?? false;
  bool get isDark => _prefs!.getBool('darkMode') ?? false;
  // setter
  set isSound(bool value) {
    _prefs!.setBool('soundKey', value);
  }

  set isDark(bool value) {
    _prefs!.setBool('darkMode', value);
  }
}

// making a simple object of class
final SharedPref sharedPref = SharedPref();
