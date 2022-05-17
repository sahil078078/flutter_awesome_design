import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May17_2022/DownloadAndStoreInLocalMemory/Pages/download_from_assets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pages/doanload_from_url.dart';

class DoanloadAndStoreHomeScree extends StatelessWidget {
  const DoanloadAndStoreHomeScree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff014872), Color(0xffa0eacf)],
            )),
          ),
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'DownLoad And Store',
            style: GoogleFonts.poly(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          bottom: TabBar(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            isScrollable: false,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle:
                GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: GoogleFonts.share(fontSize: 15),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 1.2,
              ),
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.download),
                text: 'FromUrl',
              ),
              Tab(
                icon: Icon(Icons.downloading_sharp),
                text: 'FromAssets',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DownloadFromUrlAndStore(),
            const DownloadFromAssetsAndStore(),
          ],
        ),
      ),
    );
  }
}
