// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_db_api_client/src/models/meal.dart';

class TheMealDbApiClient {
  TheMealDbApiClient();

  Future<Meal> getRandomMeal(http.Client client) async {
    final response = await client
        .get(Uri.parse('http://www.themealdb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final x = body['meals'];
      return Meal.fromJson(x as List<dynamic>);
    }
    throw Exception('Request failed');
  }
}
