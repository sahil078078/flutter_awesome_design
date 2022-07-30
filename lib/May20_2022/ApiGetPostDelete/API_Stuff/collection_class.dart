import 'dart:convert';

import 'package:http/http.dart' as http;

class UserCollectionClass {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  Rating rating;
  UserCollectionClass({
    required this.id,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.title,
    required this.rating,
  });

  factory UserCollectionClass.fromJson(Map<String, dynamic> json) {
    return UserCollectionClass(
      id: json['id'],
      image: json['image'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      title: json['title'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final double rate;
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}

Future<List<UserCollectionClass>> fetchData() async {
  String url = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(url));
  final temp = jsonDecode(response.body);
  // log("response StatusCode : " + response.statusCode.toString());
  // log('response : ' + response.runtimeType.toString());
  // log('runTime type : ' + temp.runtimeType.toString());
  // log('response body : ' + jsonDecode(response.body).toString());
  if (response.statusCode == 200) {
    final list = List<UserCollectionClass>.from(
        temp.map((e) => UserCollectionClass.fromJson(e)));
    return list;
  } else {
    throw Exception('Error :--> Failed To FetchData');
  }
}
