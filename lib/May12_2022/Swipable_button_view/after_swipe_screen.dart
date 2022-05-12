import 'package:flutter/material.dart';

class AfterSwipeScreen extends StatelessWidget {
  const AfterSwipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade400,
      ),
      body: Image.network(
        'https://groups.commonfloor.com/blog/wp-content/uploads/2015/09/Screenshot_2015-09-04-18-25-52.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
