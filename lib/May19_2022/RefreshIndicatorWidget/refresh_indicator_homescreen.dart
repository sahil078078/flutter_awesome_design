import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefreshIndicatorHomeScreen extends StatelessWidget {
  RefreshIndicatorHomeScreen({Key? key}) : super(key: key);

  final List<String> imageList = [
    'assets/images/ring1.jpg',
    'assets/images/ring2.jpg',
    'assets/images/ring3.jpg',
    'assets/images/ring4.jpg',
    'assets/images/ring5.jpg',
    'assets/favorite/fav1.jpg',
    'assets/favorite/fav2.jpg',
    'assets/favorite/fav3.jpg',
    'assets/favorite/fav4.jpg',
    'assets/favorite/fav5.jpg',
    'assets/favorite/fav6.jpg',
    'assets/favorite/fav7.jpg',
    'assets/favorite/fav8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Refresh Indicator',
          style: GoogleFonts.share(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/ring1.jpg'),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        color: Colors.white,
        strokeWidth: 5,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        semanticsLabel: 'Refresh',
        onRefresh: _refresh,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: imageList.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(bottom: 12, top: 5),
            width: MediaQuery.of(context).size.width,
            height: index > 4
                ? MediaQuery.of(context).size.height * 0.8
                : MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(7, 10),
                  blurRadius: 25,
                  spreadRadius: -10,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageList.elementAt(index),
                fit: index > 4 ? BoxFit.fill : BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 0),
    );
  }
}
