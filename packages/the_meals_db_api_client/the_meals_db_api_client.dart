import 'dart:convert';

import 'package:http/http.dart' as http;

import 'libs/src/models/exceptions.dart';
import 'libs/src/models/meals.dart';

class TheMealDbApiClient {
  TheMealDbApiClient();

  Future<Meals> getRandomMeal() async {
    try {
      final response = await http
          .get(Uri.parse('www.themealdb.com/api/json/v1/1/random.php'));
      return Meals.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } catch (_) {
      throw CouldNotFetchDetails();
    }
  }
}
