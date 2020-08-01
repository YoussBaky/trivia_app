import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:trivia_app/API/constants.dart';
import 'package:trivia_app/Models/categoryModel.dart';
import 'package:http/http.dart' as http;

// A function that converts a response body into a List<Music>.
List<CategoryClass> parseCategory(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<CategoryClass>((json) => CategoryClass.fromJson(json))
      .toList();
}

Future<List<CategoryClass>> fetchCategorys() async {
  final response = await http.get(API_GET_CATEGORYS);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return compute(parseCategory,
        json.encode(json.decode(response.body)['trivia_categories']));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load gategory');
  }
}
