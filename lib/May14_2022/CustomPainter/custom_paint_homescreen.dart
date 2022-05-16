import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/arc_page.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/circle_page.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/line_page.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/rectangle_page.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/rounded_rectangle_page.dart';
import 'package:flutter_awesome_design/May14_2022/CustomPainter/Pages/triangle_page.dart';

import 'Pages/arc2_page.dart';
import 'Pages/half_moon.dart';
import 'Pages/line_rounded_page.dart';
import 'Pages/rectangle2_page.dart';
import 'Pages/rectangle3_page.dart';
import 'Pages/rounded_corner.dart';
import 'Pages/sword_page.dart';
import 'Pages/curve_page.dart';

class CustomPaintHomeScreen extends StatelessWidget {
  const CustomPaintHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 14,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('CustomPaint'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.purple,
                  Colors.orangeAccent,
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.line_axis),
                text: 'Line',
              ),
              Tab(
                icon: Icon(Icons.line_axis_rounded),
                text: 'LineRounded',
              ),
              Tab(
                icon: Icon(Icons.rectangle_outlined),
                text: 'Rectangle',
              ),
              Tab(
                icon: Icon(Icons.rectangle_sharp),
                text: 'Rectangle2',
              ),
              Tab(
                icon: Icon(Icons.rectangle_outlined),
                text: 'Rectangle3',
              ),
              Tab(
                icon: Icon(Icons.rectangle_rounded),
                text: 'Rounded Rectangle',
              ),
              Tab(
                icon: Icon(Icons.circle_outlined),
                text: 'Circle',
              ),
              Tab(
                icon: Icon(Icons.architecture),
                text: 'Arc',
              ),
              Tab(
                icon: Icon(Icons.architecture),
                text: 'Arc2',
              ),
              Tab(
                icon: Icon(Icons.change_history),
                text: 'Triangle',
              ),
              Tab(
                icon: Icon(Icons.rounded_corner_outlined),
                text: 'RoundedCorner',
              ),
              Tab(
                icon: Icon(Icons.brightness_2_outlined),
                text: 'HalfMoon',
              ),
              Tab(
                icon: Icon(Icons.format_shapes),
                text: 'Sword',
              ),
              Tab(
                icon: Icon(Icons.timeline_outlined),
                text: 'Curve',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            LinePage(),
            LineRoundedPage(),
            RectanglePage(),
            Rectangle2Page(),
            Rectangle3Page(),
            RoundedRectanglePage(),
            CirclePage(),
            ArcPage(),
            Arc2Page(),
            TrianglePage(),
            ROundedCornerPage(),
            HalfMoonPage(),
            SwordPage(),
            CurvePage(),
          ],
        ),
      ),
    );
  }
}
