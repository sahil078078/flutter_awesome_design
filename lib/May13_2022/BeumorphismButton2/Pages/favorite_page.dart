import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May13_2022/BeumorphismButton2/custom_button.dart';
import 'package:flutter_awesome_design/May13_2022/BeumorphismButton2/custom_carousel_slider.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  List<String> favImages = [
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
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.155),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: SizedBox(
            child: Image.asset('assets/images/MyForeverFavorites.png'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCarouselSlider(
              items: favImages,
              height: MediaQuery.of(context).size.height * 0.68,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomSelectButton())
          ],
        ),
      ),
    );
  }
}
