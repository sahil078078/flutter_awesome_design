import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May12_2022/Swipable_button_view2/screen_after_swipe.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen2Btn3 extends StatefulWidget {
  const HomeScreen2Btn3({Key? key}) : super(key: key);

  @override
  State<HomeScreen2Btn3> createState() => _HomeScreen2Btn3State();
}

class _HomeScreen2Btn3State extends State<HomeScreen2Btn3> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    log('Call Buildermethod');
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: StatefulBuilder(
              builder: (context, setState) => SwipeableButtonView(
                isFinished: isFinished,
                onFinish: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ScreenAfterSwipe(),
                    ),
                  );
                },
                onWaitingProcess: () {
                  Future.delayed(const Duration(seconds: 5), () {
                    setState(() {
                      isFinished = true;
                    });
                  });
                },
                activeColor: const Color(0xFF009C41),
                buttonWidget: const Icon(Icons.arrow_forward_ios_rounded),
                buttonText: 'SLIDE TO PAYMENT',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
