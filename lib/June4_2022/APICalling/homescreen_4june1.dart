import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen4June1 extends StatelessWidget {
  const HomeScreen4June1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Container(
                margin: const EdgeInsets.all(5.5),
                width: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
              ),
              title: Text(
                'Api call'.toUpperCase(),
                style: GoogleFonts.poly(
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              actions: const [
                Icon(
                  Icons.notifications_none,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
    );
  }
}
