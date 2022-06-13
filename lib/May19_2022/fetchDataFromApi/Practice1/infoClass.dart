import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class UserInfo {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Data> data;
  final Support support;

  UserInfo({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
      support: Support.fromJson(json['support']),
    );
  }
}

class Data {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
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
