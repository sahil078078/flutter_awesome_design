import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hindText;
  final String? lableText;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator; // <String> is strickly bind
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField(
      {Key? key,
      this.hindText,
      this.lableText,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLength,
      this.obscureText = false,
      this.keyboardType,
      this.inputFormatters,
      required this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (lableText != null)
            Text(
              '$lableText',
              style: GoogleFonts.nunito(
                color: Colors.black.withOpacity(0.42),
                fontWeight: FontWeight.w600,
                fontSize: 15.5,
              ),
            ),
          if (lableText != null) const SizedBox(height: 2.2),
          TextFormField(
            validator: validator,
            // this style is for input text
            style: GoogleFonts.nunito(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.72),
            ),
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            maxLength: maxLength,
            autofocus: false,
            controller: controller,
            obscureText: obscureText!,
            scrollPhysics: const BouncingScrollPhysics(),
            decoration: InputDecoration(
              counterText: '',
              // counterText will hide remain number od word by default

              // floatingLabelBehavior: FloatingLabelBehavior.always,
              // above line is used for permanent showing lable
              floatingLabelBehavior:
                  FloatingLabelBehavior.never, // lable will never show

              hintText: hindText,
              // labelText: lableText,
              prefixIcon: prefixIcon,
              prefixIconColor: GlobalVariable.greyBackgroundColor,
              suffixIcon: suffixIcon,
              suffixIconColor: Colors.black,
              filled: true,
              fillColor: Colors.black.withOpacity(0.015),
              hintStyle: GoogleFonts.poly(
                fontSize: 14.8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: GlobalVariable.orangeColor.withOpacity(0.9),
                  width: 0.85,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey[500]!,
                  width: 0.65,
                ),
              ),

              // error border will show when error will arive
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade500,
                  width: 0.5,
                ),
              ),

              // focusedErrorBorder will show when we tap on error box/field box have an error
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red.shade500,
                  width: 0.75,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
