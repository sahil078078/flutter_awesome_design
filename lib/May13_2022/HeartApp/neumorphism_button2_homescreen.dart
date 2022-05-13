import 'btn2_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_carousel_slider.dart';
import 'custom_neumorphism_button_design.dart';

class NeuMorphismBtn2HomeScreen extends StatelessWidget {
  const NeuMorphismBtn2HomeScreen({Key? key}) : super(key: key);
  static List<String> iconsList = [
    'assets/icons/health.png',
    'assets/icons/destination.png',
    'assets/icons/wealth.png',
    'assets/icons/heart.png',
    'assets/icons/temple.png',
    'assets/icons/real_heart.png',
    'assets/icons/virtual-tour.png',
    'assets/icons/airplane.png',
    'assets/icons/people.png'
  ];
  static List<String> ringImages = [
    'assets/images/ring1.jpg',
    'assets/images/CoupleRing1.jpg',
    'assets/images/ring2.jpg',
    'assets/images/CoupleRing2.jpg',
    'assets/images/ring3.jpg',
    'assets/images/CoupleRing3.jpg',
    'assets/images/ring4.jpg',
    'assets/images/ring5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xffe3ebed),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(125),
          child: CustomAppBarBtn2(),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomCarouselSlider(
                  items: ringImages,
                  height: 180,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 10, left: 5, right: 5),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: iconsList.length,
                  itemBuilder: (context, index) {
                    return CustomNeumorphismBtnDesign(
                      iconString: iconsList.elementAt(index),
                    );
                  },
                ),
                const CustomSelectButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
