import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.elevation = 0,
    this.width = double.infinity,
    this.height = 45,
    this.buttonColor = GlobalVariable.orangeColor,
    this.textStyle,
    this.shape,
    this.padding,
    this.margin,
  }) : super(key: key);
  final double elevation, width, height;
  final Color buttonColor;
  final TextStyle? textStyle;
  final RoundedRectangleBorder? shape;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        child: Text(
          buttonText,
          style: textStyle,
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(elevation),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            padding ?? EdgeInsets.zero,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
