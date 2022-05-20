import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API_Stuff/CollectionClass.dart';

class ShopListViewDesign extends StatefulWidget {
  const ShopListViewDesign({Key? key}) : super(key: key);

  @override
  State<ShopListViewDesign> createState() => _ShopListViewDesignState();
}

class _ShopListViewDesignState extends State<ShopListViewDesign> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10),
      height: size.height * 0.44,
      child: FutureBuilder<List<UserCollectionClass>>(
        future: fetchData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<UserCollectionClass>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5, right: 10, top: 5, bottom: 5),
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 8, bottom: 5),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.network(
                        snapshot.data!.elementAt(index).image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            snapshot.data!.elementAt(index).title,
                            style: GoogleFonts.actor(),
                            textAlign: TextAlign.justify,
                          ),
                          Text(snapshot.data!
                              .elementAt(index)
                              .rating
                              .count
                              .toString()),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("Error : " + snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
