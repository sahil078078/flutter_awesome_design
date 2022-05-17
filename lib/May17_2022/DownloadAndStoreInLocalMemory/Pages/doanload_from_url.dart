import 'dart:developer';
import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFromUrlAndStore extends StatelessWidget {
  DownloadFromUrlAndStore({Key? key}) : super(key: key);
  final List<String> myLink = [
    'https://qphs.fs.quoracdn.net/main-thumb-382914722-200-mfpbpdlwksgxdtdtfuoefqklspzrmygz.jpeg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR987KLdKWB1I2B8jR3gq0l4qtbTZO2-W3bMA&usqp=CAU',
    'https://imgix.bustle.com/uploads/image/2020/6/17/9d67f705-d6cb-4e44-a98d-37c21108cef5-tony-iron-man.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg',
    'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2022/05/02/1675429-doc-strange.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoeBmg3-lgAL3Z2I2H8MotqKyYUQTlj9jm3g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy4TLhJrycb7hpNqAZmAYAHU2SZMQyIlviUw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuPXvfdQhIjF6l6AnCW473B2WdssDy1YsKoQ&usqp=CAU',
  ];
  late final String link = myLink[6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Download And Store From URL',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 10),
                    blurRadius: 20,
                    spreadRadius: -2,
                  ),
                ],
                color: Colors.black,
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(link, fit: BoxFit.fill),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  await _requestDownload(link);
                  // below code is only for showing snackbar after downloading complete
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Download complete'),
                      action: SnackBarAction(label: 'Done', onPressed: () {}),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  elevation: MaterialStateProperty.all(5),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestDownload(String link) async {
    try {
      final url = link; // it is url link from internet
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;
      final temp = await getApplicationDocumentsDirectory();
      final path = '${temp.path}/image.jpg';
      File(path).writeAsBytes(bytes);

      await GallerySaver.saveImage(path).then((value) {
        log('Image Save');
      });
      log('path : ' + path);
    } catch (e) {
      log("InCatch" + e.toString());
    }
  }
}
