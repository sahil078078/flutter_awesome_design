import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'modal_class.dart';

Future<ModalClass> fetchData3june1() async {
  String url = 'https://api.storerestapi.com/products';
  // beloved modal class for return in case of try catch will failed
  ModalClass modalClass = ModalClass(
    status: 404,
    message: 'failed',
    data: [],
  );
  try {
    final response = await http.get(Uri.parse(url));
    final temp = jsonDecode(response.body);

    log('response : $response');
    log('tempRuntimeType : ${temp.runtimeType}');
    // log('responseBody : ${response.body}');
    // log('temp : ${temp.toString()}');
    log("statusCode : ${response.statusCode}");
    if (response.statusCode == 200) {
      return ModalClass.fromJson(temp);
    } else {}
  } catch (e) {
    log('catch part : $e');
  }

  return modalClass;
}
