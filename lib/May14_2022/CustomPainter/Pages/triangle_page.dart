import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrianglePage extends StatelessWidget {
  const TrianglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Triangle',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            painter: TrianglePaint(),
          ),
        ),
      ),
    );
  }
}

class TrianglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 8
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.lineTo(
        size.width * 0.5, size.height * 0.9 - size.width * 0.8 * 0.8660254);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
