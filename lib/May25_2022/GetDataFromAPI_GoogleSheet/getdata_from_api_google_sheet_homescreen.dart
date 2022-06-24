import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May25_2022/GetDataFromAPI_GoogleSheet/get_data.dart';
import 'package:google_fonts/google_fonts.dart';

class GetDataFromGoogleSheet extends StatefulWidget {
  const GetDataFromGoogleSheet({Key? key}) : super(key: key);

  @override
  State<GetDataFromGoogleSheet> createState() => _GetDataFromGoogleSheetState();
}

class _GetDataFromGoogleSheetState extends State<GetDataFromGoogleSheet> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'PC Attendance',
          style: GoogleFonts.nunito(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // postData();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: FutureBuilder<List<GetData>>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<GetData>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black26,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey.shade300,
                        child: const Icon(
                          CupertinoIcons.person_alt,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.elementAt(index).name,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            snapshot.data![index].cName,
                            style: GoogleFonts.nunito(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.phone_fill,
                        color: Colors.green,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Arrived',
                        style: GoogleFonts.poly(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
