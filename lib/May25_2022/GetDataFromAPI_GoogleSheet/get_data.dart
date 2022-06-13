import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GetData {
  final int id;
  final String name, cName, m_no;
  final String? arrived, arrivedTime;

  GetData({
    required this.id,
    required this.name,
    required this.cName,
    required this.m_no,
    required this.arrived,
    required this.arrivedTime,
  });

  factory GetData.fromJson(Map<String, dynamic> json) {
    return GetData(
      id: json['id'],
      name: json['name'],
      cName: json['c_name'],
      m_no: json['m_no'].toString(),
      arrived: json['arrived'].toString(),
      arrivedTime: json['arrivedTime'],
    );
  }
}

Future<List<GetData>> fetchData() async {
  String url =
      "https://script.google.com/macros/s/AKfycbyVbJSCnn439x8ZwETbiPuSnS6dRx_ano7_Y1hBGp55tOU4Mi3Sd3r7bpOHCdBxuhtfgw/exec";
  final response = await http.get(Uri.parse(url));
  final temp = jsonDecode(response.body);

  log("statusCode :  ${response.statusCode.toString()}");
  log("tempType : ${temp.runtimeType}");
  log("temp : $temp");

  if (response.statusCode == 200) {
    List<GetData> list = List<GetData>.from(
      temp.map(
        (e) => GetData.fromJson(e),
      ),
    );
    return list;
  } else {
    throw Exception("Error --> Failed to fetch data");
  }
}

/*
postData() async {
  String url =
      "https://script.google.com/macros/s/AKfycbz4ffwbZgkn_WLfaEyjj_o2jN0sYh7IemKNxG14ksGpJmXXUViE_MqWUu2BosyTvLXc_Q/exec";

  try {
    final response = await http.post(Uri.parse(url));

    log("statusCode :  ${response.statusCode.toString()}");
    log("body :  ${response.body}");

    if (response.statusCode == 200) {
      log("success -> ");
    } else {
      log("statusCode in error :  ${response.statusCode.toString()}");
      throw Exception("Error --> Failed to post data");
    }
  } catch (e) {
    print("error -> ${e}");
  }
}
*/
