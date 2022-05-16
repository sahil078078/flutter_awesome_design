import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurvePage extends StatelessWidget {
  const CurvePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Curve',
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: CurvePainter(),
            child: Center(
              child: Text(
                'QuadraticBezier',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.1,
        size.width * 0.1, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.35, size.height * 0.7,
        size.width * 0.5, size.height * 0.97);
    path.quadraticBezierTo(size.width * 0.65, size.height * 0.7,
        size.width * 0.9, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.1,
        size.width * 0.5, size.height * 0.1);
    // path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
