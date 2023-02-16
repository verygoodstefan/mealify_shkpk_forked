import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/meal.dart';

class TheMealDbApiClient {
  TheMealDbApiClient();

  Future<Meal> getRandomMeal() async {
    final response =
        await http.get(Uri.parse('www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      return Meal.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception('Request failed');
  }
}
