import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwordPage extends StatelessWidget {
  const SwordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Sword',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          color: Colors.transparent,
          child: CustomPaint(
            foregroundPainter: SwordPaint(),
          ),
        ),
      ),
    );
  }
}

class SwordPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..color = Colors.red;
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.arcToPoint(
      Offset(size.width * 0.4, size.height * 0.7),
      radius: const Radius.circular(1050),
      clockwise: false,
    );
    path.lineTo(size.width * 0.25, size.height * 0.7);
    path.arcToPoint(
      Offset(size.width * 0.25, size.height * 0.75),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width * 0.45, size.height * 0.75);
    path.lineTo(size.width * 0.45, size.height * 0.95);
    path.arcToPoint(
      Offset(size.width * 0.55, size.height * 0.95),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width * 0.55, size.height * 0.75);
    path.lineTo(size.width * 0.75, size.height * 0.75);
    path.arcToPoint(
      Offset(size.width * 0.75, size.height * 0.7),
      radius: const Radius.circular(10),
      clockwise: false,
    );
    path.lineTo(size.width * 0.60, size.height * 0.7);
    path.arcToPoint(
      Offset(size.width * 0.5, size.height * 0.1),
      radius: const Radius.circular(1050),
      clockwise: false,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
