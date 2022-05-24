import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtensionMethod1 extends StatelessWidget {
  const ExtensionMethod1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Extension Method',
          style: GoogleFonts.nunito(),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ).alignAtCenterEnd(),
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ).alignAtCenter(),
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ).alignAtCenterStart(),
          Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ).alignAtTopCenter(),
          // calling with method name
          // its work same as previous
          ExtendedWidget(
            Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
          ).alignAtCenterEnd(),
        ],
      ),
    );
  }
}

// extension method
extension ExtendedWidget on Widget {
  alignAtCenterStart() {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: this,
    );
  }

  alignAtCenterEnd() {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: this,
    );
  }

  alignAtCenter() {
    return Align(
      alignment: Alignment.center,
      child: this,
    );
  }

  alignAtBottomCenter() {
    return Align(
      child: this,
      alignment: Alignment.bottomCenter,
    );
  }

  alignAtTopCenter() {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }
}
