import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Image.asset(
            'assets/favorite/fav1.jpg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Text(
              '''     कहते हैं अगर किसी चीज़ को दिल से चाहो तो पूरी कायनात उसे तुमसे मिलाने की कोशिश में लग जाती है''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Text(
              '''   Till Today I Love Her The Same, Not Because I Didn't Find Anyone Else,But Because I Don'T Have Time Left After Loving Her''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.abel(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
