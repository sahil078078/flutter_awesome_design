import 'dart:developer';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeonLightButton extends StatefulWidget {
  const NeonLightButton({Key? key}) : super(key: key);

  @override
  State<NeonLightButton> createState() => _NeonLightButtonState();
}

class _NeonLightButtonState extends State<NeonLightButton> {
  bool isPressed = false;
  Color shadowColor = Colors.deepPurple;
  late Color backgroundColor = shadowColor.withOpacity(0.2);
  @override
  Widget build(BuildContext context) {
    // log('Build Method Called');

    return Scaffold(
      backgroundColor: const Color(0xff00000f),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              for (int i = 1; i < 5; i++)
                BoxShadow(
                  spreadRadius: -1,
                  color: shadowColor,
                  blurStyle: BlurStyle.outer,
                  blurRadius: (isPressed ? 5 : 3) * (i.toDouble()),
                  inset: true,
                ),
            ],
            color: isPressed ? backgroundColor : null,
          ),
          duration: const Duration(milliseconds: 100),
          child: TextButton(
            onHover: (hovered) => setState(() {
              isPressed = hovered;
              log(hovered.toString());
            }),
            onPressed: () {
              log(isPressed.toString());
            },
            style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                  width: 4,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: Listener(
              onPointerDown: (_) => setState(() {
                isPressed = true;
                log('onPointerDown : $isPressed');
              }),
              onPointerUp: (_) => setState(() {
                isPressed = false;
                log("onPointerUp : $isPressed");
              }),
              child: Text(
                'Hello World I\'m Flutter I try best',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [
                    for (int i = 1; i < (isPressed ? 8 : 4); i++)
                      Shadow(
                        color: shadowColor,
                        blurRadius: 3 * i.toDouble(),
                        // int to double typecast
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
