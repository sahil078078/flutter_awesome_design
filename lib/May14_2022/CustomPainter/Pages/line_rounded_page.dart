import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LineRoundedPage extends StatelessWidget {
  const LineRoundedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RoundedLine',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: RoundedLine(),
          ),
        ),
      ),
    );
  }
}

class RoundedLine extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 15
      ..color = Colors.white
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
