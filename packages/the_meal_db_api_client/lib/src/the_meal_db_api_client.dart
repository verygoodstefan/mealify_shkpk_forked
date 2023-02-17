// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_db_api_client/src/models/meal.dart';
import 'package:the_meal_db_api_client/src/models/meals.dart';

class TheMealDbApiClient {
  TheMealDbApiClient(this.client);

  http.Client client;

  Future<Meal> getRandomMeal() async {
    final response = await client
        .get(Uri.parse('http://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final x =
          Meals.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return x.meals.first;
    }
    throw Exception('Request failed');
  }
}
