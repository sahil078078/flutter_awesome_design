import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedRectanglePage extends StatelessWidget {
  const RoundedRectanglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'RoundedRectangle',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            painter: RounderRectanglePaint(),
          ),
        ),
      ),
    );
  }
}

class RounderRectanglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;
    final a = Offset(size.width * 0.1, size.height * 0.1);
    final b = Offset(size.width * 0.9, size.height * 0.9);
    final rect = Rect.fromPoints(a, b);
    const radius = Radius.circular(20);
    canvas.drawRRect(RRect.fromRectAndRadius(rect, radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
