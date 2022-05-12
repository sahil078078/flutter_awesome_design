import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FlutterDownloaderHomeScreen extends StatelessWidget {
  FlutterDownloaderHomeScreen({Key? key}) : super(key: key);
  bool indicater = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange.shade300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  return indicater
                      ? const CircularProgressIndicator(
                          strokeWidth: 5,
                          color: Colors.white,
                          backgroundColor: Colors.grey,
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              indicater = true;
                            });
                            log('Download & Open Btn pressed');
                            await openFile(
                                url:
                                    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
                                fileName: 'myVideo.mp4');
                            setState(() {
                              indicater = false;
                            });
                          },
                          child: const Text('Download & Open'),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future openFile({required String url, required String fileName}) async {
    final file = await downloadFile(url, fileName);
    log(file.toString());
    if (file == null) return;
    log('path : ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    // final appStorage = "/storage/emulated/0/Download";
    final appStorage = await getApplicationSupportDirectory();
    log("appStorage : " + appStorage.path);
    final file = File('${appStorage.path}/$name');
    log("file : " + file.path);
    try {
      final respone = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          //   receiveTimeout: 0,
          //   followRedirects: false,
        ),
      );
      log(respone.data.runtimeType.toString());
      var raf = file.openSync(mode: FileMode.write);
      await raf.writeFrom(respone.data);
      await raf.close();
      return file;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
