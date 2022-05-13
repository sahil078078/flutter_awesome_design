import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HeartApp/Pages/setting_page.dart';
import '../HeartApp/Pages/favorite_page.dart';
import '../HeartApp//Pages/home_page.dart';

class CustomAppBarBtn2 extends StatelessWidget {
  const CustomAppBarBtn2({
    Key? key,
  }) : super(key: key);
  static List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SizedBox(
        child: Image.network(
          'https://image.shutterstock.com/image-photo/mountains-under-mist-morning-amazing-260nw-1725825019.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.black,
      bottom: TabBar(
        onTap: (index) {
          log(index.toString());
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => pages.elementAt(index),
              ));
        },
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
        indicatorColor: Colors.white,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: 'Home',
          ),
          Tab(
            icon: Icon(Icons.favorite),
            text: 'Favorite',
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: 'Setting',
          ),
        ],
      ),
    );
  }
}
