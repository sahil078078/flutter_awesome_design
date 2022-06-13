import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/May19_2022/fetchDataFromApi/Practice1/infoClass.dart';
import 'package:flutter_awesome_design/May19_2022/fetchDataFromApi/Practice1/post_data_in_api.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchDataHomeScreen1 extends StatefulWidget {
  const FetchDataHomeScreen1({Key? key}) : super(key: key);

  @override
  State<FetchDataHomeScreen1> createState() => _FetchDataHomeScreen1State();
}

class _FetchDataHomeScreen1State extends State<FetchDataHomeScreen1> {
  @override
  Future<UserInfo>? _getData;

  @override
  void initState() {
    super.initState();
    _getData = fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await postData().then((value) {
            setState(() {
              fetchData();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          'Fetch Data From API',
          style: GoogleFonts.adamina(
            fontWeight: FontWeight.w200,
            fontSize: 22,
          ),
        ),
      ),
      body: FutureBuilder<UserInfo>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<UserInfo> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.8),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xffabdcff), Color(0xfffad7a1)]),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5, 8),
                      spreadRadius: -8,
                      blurRadius: 20,
                    )
                  ],
                ),
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding: const EdgeInsets.only(
                    left: 10, top: 5, bottom: 5, right: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(snapshot.data!.data
                            .elementAt(index)
                            .avatar
                            .toString()),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID : ${snapshot.data!.data.elementAt(index).id}'),
                        Text(
                            'email ID : ${snapshot.data!.data.elementAt(index).email}'),
                        Text(
                            'F_Name : ${snapshot.data!.data.elementAt(index).firstName}'),
                        Text(
                            'L_Name : ${snapshot.data!.data.elementAt(index).lastName}')
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('hasError File ->: ${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
