import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen6June1 extends StatelessWidget {
  const HomeScreen6June1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          'Popup MenuBtm',
          style: GoogleFonts.poly(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Search'),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.upload,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Upload')
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.copy,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Copy')
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text('Exit'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
