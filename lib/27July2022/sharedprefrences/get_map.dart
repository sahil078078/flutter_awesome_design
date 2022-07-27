import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Dio dio = Dio();

class GetMapDataProvider extends ChangeNotifier {
  List<Company> company = [];

  Future<void> getMapData() async {
    String _url = 'https://jsonkeeper.com/b/W5KS';

    try {
      Response response = await dio.get(_url, options: Options(
        validateStatus: (status) {
          return (status == 200 || status == 404 || status == 400);
        },
      ));

      log('responseCode : ${response.statusCode}');
      log('responceData : ${response.data}');

      if (response.statusCode == 200) {
        var x = response.data['company'];
        company = List<Company>.from(
          x.map(
            (e) => Company.fromJson(e),
          ),
        ).toList(growable: true);
        notifyListeners();
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        log('DioErrorCatch : $e');
      }
      company = [];
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        log('catchError : $e');
      }
      company = [];
      notifyListeners();
    }
  }
}

class Company {
  Company({
    required this.id,
    required this.type,
    required this.name,
  });

  String id;
  String type;
  String name;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        type: json["type"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
      };
}

class SharedPref2 {
  static SharedPreferences? _sharedPreferences;

  void init(BuildContext context) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  String get jsonEncodeString =>
      _sharedPreferences!.getString('jsonEncodeString') ?? '';
}
