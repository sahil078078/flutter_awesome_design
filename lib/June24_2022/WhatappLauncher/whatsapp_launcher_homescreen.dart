import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/June24_2022/WhatappLauncher/whatsapp_launcher_body.dart';
import 'package:flutter_awesome_design/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatsAppLauncerHomeScreen extends StatelessWidget {
  const WhatsAppLauncerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: GlobalVariable.whatsAppBarColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'WhatsApp Launcher',
          style: GoogleFonts.nunito(
            color: Colors.black.withOpacity(0.52),
          ),
        ),
      ),
      body: const WhataAppLauncherBody(),
    );
  }
}
