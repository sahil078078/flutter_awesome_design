import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May20_2022/ApiGetPostDelete/Models/custom_carousel_slider_for_fashion.dart';

import 'Models/category_list_scroller.dart';
import 'Models/custom_appbar_design.dart';
import 'Models/custom_search_bar_design.dart';
import 'Models/shop_listviev.dart';

class ApiGetPostDeleteHomeScreen extends StatelessWidget {
  const ApiGetPostDeleteHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.045),
            const CustomAppBar(),
            SizedBox(height: size.height * 0.015),
            const CustomSearchBar(),
            SizedBox(height: size.height * 0.015),
            const CategoryListScroller(),
            MyCustomCarouselSliderForFashion(),
            SizedBox(height: size.height * 0.015),
            const ShopListViewDesign(),
          ],
        ),
      ),
    );
  }
}
