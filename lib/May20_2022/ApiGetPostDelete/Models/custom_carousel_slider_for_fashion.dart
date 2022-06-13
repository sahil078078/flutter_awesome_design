import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomCarouselSliderForFashion extends StatelessWidget {
  MyCustomCarouselSliderForFashion({
    Key? key,
  }) : super(key: key);
  final List<String> backImage = [
    'assets/background/girl1.png',
    'assets/background/girl2.png',
    'assets/background/girl3.png',
    'assets/background/girl4.png',
    'assets/background/girl5.png',
    'assets/background/girl6.png',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        initialPage: 0,
        autoPlayCurve: Curves.decelerate,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration: const Duration(seconds: 5),
      ),
      items: backImage.map((e) {
        return Builder(
          builder: (context) {
            return SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 5,
                    left: 5,
                    child: Container(
                      height: size.height * 0.18,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xffd1c6f3),
                            Color(0xffe9bcac),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Image.asset(
                        e,
                        width: size.width * 0.35,
                        height: size.height * 0.25,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    bottom: 10.0,
                    child: Container(
                      width: size.width * 0.35,
                      height: size.height * 0.25,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            'Style',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'It\'s loved all around the world as you can reinvent, express, create & stand out from the rest of the crowd. It also gives you confidence.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.actor(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
