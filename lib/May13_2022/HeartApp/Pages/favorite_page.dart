import 'package:flutter/material.dart';

import '../../HeartApp/custom_carousel_slider.dart';
import '../custom_button.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  static List<String> favImages = [
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
