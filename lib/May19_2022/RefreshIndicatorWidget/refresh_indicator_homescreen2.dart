import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefreshIndicatorHomeScreen2 extends StatefulWidget {
  const RefreshIndicatorHomeScreen2({Key? key}) : super(key: key);

  @override
  State<RefreshIndicatorHomeScreen2> createState() =>
      _RefreshIndicatorHomeScreen2State();
}

class _RefreshIndicatorHomeScreen2State
    extends State<RefreshIndicatorHomeScreen2> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Refresh Indicator',
          style: GoogleFonts.aclonica(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
        strokeWidth: 5,
        onRefresh: _refreshHandle,
        child: ListView(
          children: _getItems(),
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> items = [];
    for (int i = _count; i <= _count + 9; i++) {
      var item = Column(
        children: [
          ListTile(
            leading: const Icon(Icons.call),
            title: Text('person ${1 + i}'),
          ),
          const Divider(
            color: Colors.grey,
            height: 1.2,
          ),
        ],
      );
      items.add(item);
    }
    return items;
  }

  Future<void> _refreshHandle() {
    setState(() {
      _count = _count + 10;
    });
    return Future.delayed(const Duration(seconds: 1));
  }
}
