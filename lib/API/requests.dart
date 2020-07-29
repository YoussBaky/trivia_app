import 'dart:convert';

import 'package:trivia_app/API/constants.dart';
import 'package:trivia_app/Models/category.dart';
import 'package:http/http.dart' as http;

Future<Gategory> fetchCategorys() async {
  final response = await http.get(API_GET_CATEGORYS);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Gategory.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load gategory');
  }
}
