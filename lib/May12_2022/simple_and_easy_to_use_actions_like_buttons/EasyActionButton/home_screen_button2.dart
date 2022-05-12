// library : https://pub.dev/packages/easy_actions
import 'package:easy_actions/easy_actions.dart';
import 'package:flutter/material.dart';

class HomeScreen2Btn1 extends StatelessWidget {
  const HomeScreen2Btn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyActionButton'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EasyElevatedButton(label: 'ActionBtn', onPressed: () {}),
            EasyElevatedButton(
              label: 'ActionBtn1',
              onPressed: () {},
              isRounded: false,
              elevation: 0,
              haptics: true,
              isTrailingIcon: true,
              icon: const Icon(Icons.star),
              width: 200,
              color: Colors.green,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              labelColor: Colors.black,
              borderRadius: 50,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            EasyOutlinedButton(
              label: 'OutLineBtn',
              onPressed: () {},
            ),
            EasyOutlinedButton(
              onPressed: () {},
              label: 'OutlineBtn',
              borderRadius: 20,
              labelColor: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              height: 50,
              color: Colors.black,
              isRounded: false,
              icon: const Icon(Icons.star),
              isTrailingIcon: true,
            )
          ],
        ),
      ),
    );
  }
}
