import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageSharePage extends StatelessWidget {
  const ImageSharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'DownloadAndShare',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.28,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUX_sByzMfSUXwIL1LxeapHLfu0_ukcPy8bA&usqp=CAU',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                const url =
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUX_sByzMfSUXwIL1LxeapHLfu0_ukcPy8bA&usqp=CAU';
                final responce = await http.get(Uri.parse(url));
                final bytes = responce.bodyBytes;
                final temp = await getTemporaryDirectory();
                final path = '${temp.path}/Image.jpg';
                File(path).writeAsBytesSync(bytes);
                log(path);
                await Share.shareFiles([path]);
              },
              child: Text(
                'ShareImage',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
