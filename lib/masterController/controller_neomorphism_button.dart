import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'master_controller_constants.dart';

class ControllerNeomorphismButton extends StatelessWidget {
  final double? width, height, buttonRadius;
  final Widget? child;
  final String? buttonName;
  final TextStyle? textStyle;
  const ControllerNeomorphismButton({
    Key? key,
    this.height,
    this.width,
    this.buttonRadius,
    this.child,
    this.buttonName,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Listener(
          onPointerUp: (event) {},
          onPointerDown: (event) {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.all(10),
            width: width ?? size.width * 0.22,
            height: height ?? size.width * 0.22,
            decoration: BoxDecoration(
              color: blue1,
              borderRadius:
                  BorderRadius.circular(buttonRadius ?? size.width * 0.22),
              gradient: lighBblueDarkBlue,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(5, 5),
                  color: greyColor,
                  blurRadius: 6,
                ),
                BoxShadow(
                  offset: Offset(-4, -4),
                  color: lightWhite,
                  blurRadius: 4,
                )
              ],
            ),
            child: child,
          ),
        ),
        Expanded(
          child: Text(
            buttonName ?? 'Flutter',
            style: textStyle ??
                GoogleFonts.montserrat(
                  color: greyDark,
                  fontSize: size.width * 0.042,
                ),
          ),
        ),
      ],
    );
  }
}
