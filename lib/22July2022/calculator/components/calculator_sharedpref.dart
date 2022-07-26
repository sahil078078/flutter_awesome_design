import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? _prefs;
  void init({required BuildContext context}) async {
    _prefs = await SharedPreferences.getInstance();
  }

  // getter
  bool get isSound => _prefs?.getBool('soundKey') ?? false;
  bool get isDark => _prefs?.getBool('darkMode') ?? false;
  // setter
  set isSound(value) {
    _prefs?.setBool('soundKey', value);
  }

  set isDark(value) {
    _prefs?.setBool('darkMode', value);  
  }
}

// making a simple object of class
final SharedPref sharedPref = SharedPref();
