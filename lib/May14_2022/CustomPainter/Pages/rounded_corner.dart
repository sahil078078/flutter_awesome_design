import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ROundedCornerPage extends StatelessWidget {
  const ROundedCornerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RoundedCorner',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: RoundedCornerPaint(),
          ),
        ),
      ),
    );
  }
}

class RoundedCornerPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width * 0.1, size.height * 0.1);
    path.lineTo(size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.width * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.5);
    path.arcToPoint(
      Offset(size.width * 0.5, size.height * 0.1),
      radius: const Radius.circular(130),
      clockwise: false,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
