import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleColorPicker extends StatefulWidget {
  const SimpleColorPicker({Key? key}) : super(key: key);

  @override
  State<SimpleColorPicker> createState() => _SimpleColorPickerState();
}

class _SimpleColorPickerState extends State<SimpleColorPicker> {
  Color color = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('ColorPicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: ElevatedButton(
                onPressed: () {
                  log(color.toString());
                  pickColor(context);
                },
                child: const Text('SelectColor'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Pick Your Color',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildColorPicker(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Select',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorPicker() {
    return ColorPicker(
        pickerColor: color,
        onColorChanged: (color) {
          setState(() {
            this.color = color;
          });
        });
  }
}
