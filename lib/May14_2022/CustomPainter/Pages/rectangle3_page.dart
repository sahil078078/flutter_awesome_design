import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rectangle3Page extends StatelessWidget {
  const Rectangle3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Rectangle3',
          style: GoogleFonts.acme(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              const Shadow(
                color: Colors.cyanAccent,
                offset: Offset(8, 5),
                blurRadius: 10,
              ),
              const Shadow(
                color: Colors.red,
                offset: Offset(-8, -5),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: Rectangle3Paint(),
            child: Center(
              child: Text(
                'Rectangle',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Rectangle3Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final rect = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.5),
      width: size.width * 0.8,
      height: size.height * 0.95,
    );
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
