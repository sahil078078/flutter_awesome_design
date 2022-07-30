import 'dart:convert';
import 'dart:developer';

import 'package:flutter_awesome_design/May19_2022/fetchDataFromApi/Practice1/info_class.dart';
import 'package:http/http.dart' as http;

Future<Data> postData() async {
  String url = 'https://reqres.in/api/users';

  final response = await http.post(
    Uri.parse(url),
    body: jsonEncode(
      <String, dynamic>{
        "id": 7,
        "email": "sahilprajapati@gmail.com",
        "first_name": "Sahil",
        "last_name": "Prajapati",
        "avatar":
            "https://qphs.fs.quoracdn.net/main-thumb-382914722-200-mfpbpdlwksgxdtdtfuoefqklspzrmygz.jpeg",
      },
    ),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  log('response code : ' + response.statusCode.toString());
  log('response body  : ' + response.body);
  log('responce.body ->: ' + jsonDecode(response.body).toString());

  if (response.statusCode == 201) {
    return Data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post data');
  }
}
