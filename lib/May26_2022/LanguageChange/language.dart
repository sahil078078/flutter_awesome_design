import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May26_2022/LanguageChange/lang_change_homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Languages extends StatelessWidget {
  const Languages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black26,
        title: const Text('Languages'),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select a language. The changes will automaticaly be applied to all the Text widget with the .tr() extension throughout the app',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPress: () {},
                text: 'English',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPress: () {},
                text: 'Hindi',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPress: () {},
                text: 'Gujarati',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPress: () {},
                text: 'Marathi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
