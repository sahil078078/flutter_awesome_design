import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeuMorphismBtn1 extends StatefulWidget {
  NeuMorphismBtn1({required this.title, Key? key}) : super(key: key);
  String title;

  @override
  State<NeuMorphismBtn1> createState() => _NeuMorphismBtn1State();
}

class _NeuMorphismBtn1State extends State<NeuMorphismBtn1> {
  late bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? const Offset(15, 15) : const Offset(28, 28);
    double blurRadius = isPressed ? 5 : 30;
    return Scaffold(
      backgroundColor: const Color(0xffdee4e7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          widget.title,
          style: GoogleFonts.oswald(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Listener(
          onPointerUp: (_) {
            setState(() {
              isPressed = false;
            });
          },
          onPointerDown: (_) {
            setState(() {
              isPressed = true;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white, // same as background color
              boxShadow: [
                BoxShadow(
                  blurRadius: blurRadius,
                  color: Colors.transparent,
                  offset: -distance,
                  inset: isPressed,
                ),
                BoxShadow(
                  color: const Color(0xffa7a9a7),
                  offset: distance,
                  blurRadius: blurRadius,
                  inset: isPressed,
                ),
              ],
            ),
            child: SizedBox(
              height: 150,
              width: 150,
              child: Center(
                child: isPressed
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.green,
                        size: 50,
                      )
                    : const Icon(
                        Icons.thumb_up,
                        size: 50,
                        color: Colors.grey,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
