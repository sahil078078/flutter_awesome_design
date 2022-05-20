import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListScroller extends StatefulWidget {
  const CategoryListScroller({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryListScroller> createState() => _CategoryListScrollerState();
}

class _CategoryListScrollerState extends State<CategoryListScroller> {
  final List<String> categoryList = [
    'All',
    'Fashion',
    'Popular',
    'Regular',
    'Casual',
    'Summer',
    'Women',
    'Men',
    'Child',
    'Kids',
    'Night',
    'UnderWear',
    'Wedding',
    'Short',
    'Cute',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 40,
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: index == selectedIndex
                  ? const Color(0xffcbe7e3)
                  : Colors.black12,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: index == selectedIndex
                    ? const Color(0xff05999e)
                    : Colors.black54,
                width: index == selectedIndex ? 1.5 : 1,
              ),
            ),
            child: Text(
              categoryList.elementAt(index),
              textAlign: TextAlign.center,
              style: GoogleFonts.geo(),
            ),
          ),
        ),
      ),
    );
  }
}
