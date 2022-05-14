import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rectangle2Page extends StatelessWidget {
  const Rectangle2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Rectangle2',
          style: GoogleFonts.podkova(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: Rectangle2Paint(),
          ),
        ),
      ),
    );
  }
}

class Rectangle2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.red;
    final rect = Rect.fromLTRB(
      size.width * 0.15,
      size.height * 0.1,
      size.width * 0.9,
      size.height * 0.95,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
