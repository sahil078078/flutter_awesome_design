import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle buttonTextStyle({required bool isDark}) {
  return GoogleFonts.montserrat(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: isDark ? Colors.white : Colors.black.withOpacity(0.52),
  );
}
