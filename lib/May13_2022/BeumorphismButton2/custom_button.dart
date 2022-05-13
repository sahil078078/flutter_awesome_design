import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectButton extends StatelessWidget {
  const CustomSelectButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 15, top: 10),
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            Color(0xffead6ee),
            Color(0xffa0f1ea),
          ],
        ),
      ),
      child: Center(
        child: Text(
          'Select',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
