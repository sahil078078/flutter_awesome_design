import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class MakingFolderHomeScreen extends StatelessWidget {
  const MakingFolderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariable.orangeColor,
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          'FolderDesign',
          style: GoogleFonts.nunito(),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: GlobalVariable.orangeColor,
                elevation: 0.0,
              ),
              onPressed: () async {
                const folderName = '24-06-2022';
                String name = await createFolder(folderName: folderName);
                log('name : $name');
              },
              child: Text(
                'Create',
                style: GoogleFonts.nunito(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> createFolder({required String folderName}) async {
    // below code used for creat folder in bydefault location

    // final dir = Directory((Platform.isAndroid
    //             ? await getExternalStorageDirectory() //FOR ANDROID
    //             : await getApplicationSupportDirectory() //FOR IOS
    //         )!
    //         .path +
    //     '/$folderName');

    // below code is creat folder at desire location
    final dir = Directory("/storage/emulated/0/$folderName");

    var status = await Permission.storage.status;
    log("stausrunTypeType : ${status.runtimeType}");
    log('status : $status');
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    if (await dir.exists()) {
      return dir.path;
    } else {
      dir.create();
      return dir.path;
    }

    // String newPath = '';
    // List<String> folders = dir.path.split('/');
    // for (int x = 1; x < folders.length; x++) {
    //   String folder = folders[x];
    //   if (folder != 'Android') {
    //     newPath += '/' + folder;
    //   } else {
    //     break;
    //   }
    // }
    // // newPath = newPath + '/$folderName';
    //
    // return newPath;
  }
}
