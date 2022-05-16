import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HalfMoonPage extends StatelessWidget {
  const HalfMoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'HalfMoon',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: 300,
          width: 300,
          child: CustomPaint(
            foregroundPainter: HalfMoonPaint(),
          ),
        ),
      ),
    );
  }
}

class HalfMoonPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.2);
    path.arcToPoint(
      Offset(size.width * 0.9, size.height * 0.5),
      radius: const Radius.circular(150),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(size.width * 0.2, size.height * 0.2),
      radius: const Radius.circular(70),
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
