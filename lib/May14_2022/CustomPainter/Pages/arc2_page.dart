import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Arc2Page extends StatelessWidget {
  const Arc2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'ArcDesign',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.transparent,
          child: CustomPaint(
            painter: Arc2Paint(),
          ),
        ),
      ),
    );
  }
}

class Arc2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final arc1 = Path();
    arc1.moveTo(size.width * 0.1, size.height * 0.1);
    arc1.arcToPoint(
      Offset(size.width * 0.9, size.height * 0.1),
      radius: const Radius.circular(250),
      clockwise: false,
    );

    final arc2 = Path();
    arc2.moveTo(size.width * 0.1, size.height * 0.1);
    arc2.arcToPoint(
      Offset(size.width * 0.1, size.height * 0.9),
      radius: const Radius.circular(250),
    );

    final arc3 = Path();
    arc3.moveTo(size.width * 0.1, size.height * 0.9);
    arc3.arcToPoint(
      Offset(size.width * 0.9, size.height * 0.9),
      radius: const Radius.circular(250),
    );

    final arc4 = Path();
    arc4.moveTo(size.width * 0.9, size.height * 0.9);
    arc4.arcToPoint(
      Offset(size.width * 0.9, size.height * 0.1),
      radius: const Radius.circular(250),
    );

    canvas.drawPath(arc1, paint);
    canvas.drawPath(arc2, paint);
    canvas.drawPath(arc3, paint);
    canvas.drawPath(arc4, paint);

    final paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.orangeAccent
      ..strokeWidth = 5;

    final arc5 = Path();
    arc5.moveTo(size.width * 0.1, size.height * 0.5);
    arc5.arcToPoint(
      Offset(size.width * 0.5, size.height * 0.9),
      radius: const Radius.circular(250),
    );

    final arc6 = Path();
    arc6.moveTo(size.width * 0.5, size.height * 0.9);
    arc6.arcToPoint(
      Offset(size.width * 0.9, size.height * 0.5),
      radius: const Radius.circular(250),
    );

    final arc7 = Path();
    arc7.moveTo(size.width * 0.9, size.height * 0.5);
    arc7.arcToPoint(
      Offset(size.width * 0.5, size.height * 0.1),
      radius: const Radius.circular(250),
    );

    final arc8 = Path();
    arc8.moveTo(size.width * 0.5, size.height * 0.1);
    arc8.arcToPoint(
      Offset(size.width * 0.1, size.height * 0.5),
      radius: const Radius.circular(250),
    );

    canvas.drawPath(arc5, paint2);
    canvas.drawPath(arc6, paint2);
    canvas.drawPath(arc7, paint2);
    canvas.drawPath(arc8, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
