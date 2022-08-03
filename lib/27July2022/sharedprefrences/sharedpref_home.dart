import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/27July2022/sharedprefrences/get_map.dart';
import 'package:provider/provider.dart';

class SharedPrefHomeScreen extends StatefulWidget {
  const SharedPrefHomeScreen({Key? key}) : super(key: key);

  @override
  State<SharedPrefHomeScreen> createState() => _SharedPrefHomeScreenState();
}

class _SharedPrefHomeScreenState extends State<SharedPrefHomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<GetMapDataProvider>().getMapData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Company> company = context.read<GetMapDataProvider>().company;
    // var x = jsonEncode(company);

    // log('type : ${x.runtimeType}');
    // sharedPref.apiStuff = x;
    // Map y = jsonDecode(sharedPref.apiStuff);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0.0,
          title: const Text('Map Store in SharedPref'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.home),
                text: 'Home2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await context.read<GetMapDataProvider>().getMapData();

                    idk(context); //  api calling
                  },
                  child: const Text('call API'),
                ),
              ],
            ),

            // for tabBar2
            const Center(
              child: Text('home2'),
            ),
          ],
        ),
      ),
    );
  }
}

idk(BuildContext context) async {
  List<Company> company = context.read<GetMapDataProvider>().company;

  String x = jsonEncode(company);
  // log('type : ${x}');

  // sharedPref.apiStuff = x;
  // Map<String, dynamic> y = await jsonDecode(x) as Map<String, dynamic>;
  // log('gerData : ${y[0]['name']}');

  var decode = json.decode(x);
  var com = List<Company>.from(
    decode.map(
      (e) => Company.fromJson(e),
    ),
  ).toList(growable: true);

  log('com : $com');
  // log('decoder : $decode');

  // log('=======> ${com.elementAt(1).type}');

  // sharedPref.apiStuff = '{company: [{id: 0001, type: man, name: Cake}]}';
}
