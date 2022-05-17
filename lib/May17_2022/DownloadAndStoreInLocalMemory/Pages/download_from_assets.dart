import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFromAssetsAndStore extends StatelessWidget {
  const DownloadFromAssetsAndStore({Key? key}) : super(key: key);
  final String imageLink = 'assets/images/ring4.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Download And Store From Assets',
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
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 10),
                    blurRadius: 20,
                    spreadRadius: -2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageLink,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              child: ElevatedButton(
                onPressed: () async {
                  await getImageFileFromAssets(imageLink);
                  // this below code only fow showing snackbar after completing downloading task
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: const [
                          Text('Download Complete'),
                          Spacer(),
                          Icon(Icons.done, color: Colors.white),
                        ],
                      ),
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
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getImageFileFromAssets(String link) async {
    try {
      final path = await getApplicationDocumentsDirectory();

      final byteData = await rootBundle.load(link);

      final file = '${path.path}/image.jpg';

      await File(file).writeAsBytes(byteData.buffer.asInt8List());
      log('path     : -> $path');
      log('byteData : -> ${byteData.runtimeType}');
      log('file     : -> ' + file);
      await GallerySaver.saveImage(file).then((value) => log('Image Save'));
    } catch (e) {
      log("InCatch file : -> " + e.toString());
    }
  }
}
