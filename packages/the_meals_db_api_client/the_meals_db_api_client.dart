import 'dart:convert';

import 'package:http/http.dart' as http;

import 'libs/src/models/exceptions.dart';
import 'libs/src/models/meals.dart';

class TheMealDbApiClient {
  /// {@macro the_meal_db_api_client}
  TheMealDbApiClient();

  Future<Meals> getRandomMeal() async {
    Uri url = Uri.https('www.themealdb.com/api/json/v1/1/', 'random.php');

    try {
      var response = await http.get(url);
      return Meals.fromJson(jsonDecode(response.data!) as Map<String, dynamic>);
    } catch (_) {
      throw CouldNotFetchDetails();
    }
  }
}
