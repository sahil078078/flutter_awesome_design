import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: Colors.black12, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/categorySmall.png'),
              color: Colors.green,
            ),
          ),
          Column(
            children: [
              Text(
                'Arizona',
                style: GoogleFonts.oswald(
                  color: Colors.grey,
                  fontSize: 19,
                ),
              ),
              Text(
                'Buy Happiness',
                style: GoogleFonts.oswald(
                  color: Colors.black26,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                color: Colors.black12, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/personSmall.png'),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
