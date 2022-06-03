import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/June3_2022/Simple_Api_calling/modal_class.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen6JuneSimpleAPICalling extends StatelessWidget {
  const HomeScreen6JuneSimpleAPICalling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'API Fetch',
          style: GoogleFonts.poppins(
            color: Colors.black38,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<ModalClass>(
        future: fetchData3june1(),
        builder: (context, AsyncSnapshot<ModalClass> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data!.data[index].createdBy.id);
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error : ${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
