import 'package:flutter/material.dart';

class ScreenAfterSwipe extends StatelessWidget {
  const ScreenAfterSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network('https://images.megapixl.com/2102/21022665.jpg'),
    );
  }
}
