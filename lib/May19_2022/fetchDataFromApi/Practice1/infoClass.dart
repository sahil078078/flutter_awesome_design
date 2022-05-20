import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class UserInfo {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<Data> data;
  final Support support;

  UserInfo({
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
    required this.data,
    required this.support,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      page: json['page'],
      per_page: json['per_page'],
      total: json['total'],
      total_pages: json['total_pages'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      support: Support.fromJson(json['support']),
    );
  }
}

class Data {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Data({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }
}

Future<UserInfo> fetchData() async {
  String url = 'https://reqres.in/api/users?page=1&per_page=20';
  final response = await http.get(Uri.parse(url));
  log('response : ' + response.toString());
  log('response type : ' + response.runtimeType.toString());
  log('response code : ' + response.statusCode.toString());
  log('response body : ' + response.body);
  final temp = jsonDecode(response.body);
  if (response.statusCode == 200) {
    UserInfo userInstance = UserInfo.fromJson(temp);
    return userInstance;
  } else {
    throw Exception('Failed To Fetch Data');
  }
}
