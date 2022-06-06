import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/arc_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen6June2 extends StatelessWidget {
  const HomeScreen6June2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(
          'Popup MenuBtn',
          style: GoogleFonts.nunito(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            elevation: 0.65,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (context) {
              return <PopupMenuItem>[
                buildPopupMenuItem(
                  icon: Icons.search,
                  text: 'Search',
                  press: () {
                    log('search');
                  },
                ),
                buildPopupMenuItem(
                  icon: Icons.upload,
                  text: 'Upload',
                  press: () {
                    log('upload');
                  },
                ),
                buildPopupMenuItem(
                  icon: Icons.payment,
                  text: 'Payment',
                  press: () {
                    log('payment');
                  },
                ),
                buildPopupMenuItem(
                  icon: Icons.contact_page,
                  text: 'contact us',
                  press: () {
                    log('contact us');
                  },
                ),
                buildPopupMenuItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  press: () {
                    log('logout');
                  },
                ),
              ];
            },
          )
        ],
      ),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(
      {required IconData icon,
      required String text,
      required VoidCallback press}) {
    return PopupMenuItem(
      onTap: () => press(),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.acme(),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
