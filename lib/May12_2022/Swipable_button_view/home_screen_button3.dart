import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'after_swipe_screen.dart';

class HomeScreen2Btn2 extends StatefulWidget {
  const HomeScreen2Btn2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2Btn2> createState() => _HomeScreen2Btn2State();
}

class _HomeScreen2Btn2State extends State<HomeScreen2Btn2> {
  late bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xff009c41),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            'https://www.teahub.io/photos/full/56-563068_beautiful-wallpapers-for-home-screen.jpg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: SwipeableButtonView(
              isFinished: isFinished,
              onFinish: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const AfterSwipeScreen(),
                  ),
                );
              },
              onWaitingProcess: () {
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    isFinished = true;
                  });
                });
              },
              activeColor: Colors.green,
              buttonWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_forward_ios_sharp),
                ],
              ),
              buttonText: 'Swipe for Payment',
            ),
          ),
        ],
      ),
    );
  }
}
