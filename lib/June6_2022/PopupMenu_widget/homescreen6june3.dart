import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Position { search, upload, copy, exit }

class HomeScreen6June3 extends StatefulWidget {
  const HomeScreen6June3({Key? key}) : super(key: key);

  @override
  State<HomeScreen6June3> createState() => _HomeScreen6June3State();
}

class _HomeScreen6June3State extends State<HomeScreen6June3> {
  int _popupMenuIndex = 0;
  Color? _changeColorAccordingToMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                _popupMenuIndex = value as int;
                log(_popupMenuIndex.toString());
              });
              if (value == Position.search.index) {
                _changeColorAccordingToMenuItem = Colors.amber;
              } else if (value == Position.upload.index) {
                _changeColorAccordingToMenuItem = Colors.cyan;
              } else if (value == Position.copy.index) {
                _changeColorAccordingToMenuItem = Colors.red;
              } else if (value == Position.exit.index) {
                _changeColorAccordingToMenuItem = Colors.green;
              }
            },
            itemBuilder: (context) => <PopupMenuItem>[
              buildPopupMenuItem(
                title: 'search',
                icon: Icons.search,
                position: Position.search.index,
              ),
              buildPopupMenuItem(
                title: 'upload',
                icon: Icons.upload,
                position: Position.upload.index,
              ),
              buildPopupMenuItem(
                title: 'copy',
                icon: Icons.copy,
                position: Position.copy.index,
              ),
              buildPopupMenuItem(
                title: 'exit',
                icon: Icons.exit_to_app,
                position: Position.exit.index,
              )
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(Position.search.index.toString()),
              Text(Position.upload.index.toString()),
              Text(Position.copy.index.toString()),
              Text(Position.exit.index.toString()),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: _changeColorAccordingToMenuItem ?? Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'text',
                style: GoogleFonts.poly(),
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem<dynamic> buildPopupMenuItem(
      {required String title, required IconData icon, required int position}) {
    return PopupMenuItem(
      value: position,
      // it is position given by user
      // 0 1 2 3 4 similar but as per user define
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black54,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.poly(),
          ),
        ],
      ),
    );
  }
}
