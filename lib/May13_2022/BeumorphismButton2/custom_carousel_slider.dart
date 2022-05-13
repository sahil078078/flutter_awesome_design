import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({
    required this.items,
    required this.height,
    Key? key,
  }) : super(key: key);
  List<String> items;
  double height;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        autoPlay: true,
        reverse: false,
        initialPage: 0,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(seconds: 5),
        autoPlayCurve: Curves.decelerate,
        enlargeCenterPage: true,
        disableCenter: true,
      ),
      items: items.map((e) {
        return Builder(
          builder: (context) {
            return Container(
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 5),
                      blurRadius: 20,
                      spreadRadius: -10)
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(e, fit: BoxFit.fill)),
            );
          },
        );
      }).toList(),
    );
  }
}
