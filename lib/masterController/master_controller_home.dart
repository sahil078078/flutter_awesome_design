import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/masterController/master_controller_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller_neomorphism_button.dart';

class MasterControllerHomeScreen extends StatefulWidget {
  const MasterControllerHomeScreen({Key? key}) : super(key: key);

  @override
  State<MasterControllerHomeScreen> createState() =>
      _MasterControllerHomeScreenState();
}

class _MasterControllerHomeScreenState
    extends State<MasterControllerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundGrey4,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blue1,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 0.75,
            ),
            gradient: lighBblueDarkBlue,
          ),
        ),
        elevation: 0.0,
        title: Text(
          'My Diary',
          style: GoogleFonts.firaCode(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
      ),
      body: const ControllerNeomorphismButton(),
    );
  }
}
