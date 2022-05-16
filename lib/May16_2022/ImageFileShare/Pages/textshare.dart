import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class TextSharePage extends StatelessWidget {
  const TextSharePage({Key? key}) : super(key: key);
  final String shareTxt = 'Share Text ❄ ❄ ❄';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'ShareText',
          style: GoogleFonts.oswald(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              shareTxt,
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await Share.share(shareTxt);
              },
              child: Text(
                'ShareTxt',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffabf8e7).withOpacity(0.6),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
