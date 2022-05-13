import 'dart:developer';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CustomNeumorphismBtnDesign extends StatefulWidget {
  const CustomNeumorphismBtnDesign({
    required this.iconString,
    Key? key,
  }) : super(key: key);
  final String iconString;

  @override
  State<CustomNeumorphismBtnDesign> createState() =>
      _CustomNeumorphismBtnDesignState();
}

class _CustomNeumorphismBtnDesignState
    extends State<CustomNeumorphismBtnDesign> {
  late bool isPressed = false;

  late double blurRadius = 20;

  late Offset distance = isPressed ? const Offset(5, 5) : const Offset(5, 15);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
          log(isPressed.toString());
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffffffff),
              Color(0xffced2d5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: isPressed ? Colors.grey : Colors.transparent,
              offset: distance,
              blurRadius: blurRadius,
              inset: isPressed,
            ),
            BoxShadow(
              color: isPressed ? Colors.white : Colors.transparent,
              offset: -distance,
              blurRadius: blurRadius,
              inset: isPressed,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: 80,
          child: Image.asset(
            widget.iconString,
            color: isPressed ? Colors.green : Colors.grey,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
