import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May16_2022/ImageFileShare/Pages/imageshare.dart';
import 'package:flutter_awesome_design/May16_2022/ImageFileShare/Pages/textshare.dart';
import 'package:flutter_awesome_design/May16_2022/ImageFileShare/Pages/videoshare.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/input_textshare.dart';

/*

for sharing file , text , video in android,ios,max,linus and web we use
library provide by flutter in pub.dev
library name : flutter_share it is 100% liked
and flutter favorite
link : https://pub.dev/packages/share_plus/install

youtube Link : https://www.youtube.com/watch?v=CNUBhb_cM6E

*/

class ShareFiles extends StatelessWidget {
  const ShareFiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffabf8e7), Color(0xff8778c7)],
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text(
            'ShareFiles',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black38,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            indicator: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12.withOpacity(0.1),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.text_fields),
                text: "TxtShare",
              ),
              Tab(
                icon: Icon(Icons.text_decrease_outlined),
                text: "InputShare",
              ),
              Tab(
                icon: Icon(Icons.image),
                text: "ImgShare",
              ),
              Tab(
                icon: Icon(Icons.video_collection),
                text: "VidShare",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const TextSharePage(),
            InputTxtShare(),
            const ImageSharePage(),
            const VideoSharePage(),
          ],
        ),
      ),
    );
  }
}
