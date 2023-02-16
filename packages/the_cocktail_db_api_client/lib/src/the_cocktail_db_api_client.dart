// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_db_api_client/src/models/drink.dart';

class TheCocktailDbApiClient {
  TheCocktailDbApiClient();

  Future<Drink> getRandomDrink() async {
    final response = await http
        .get(Uri.parse('www.thecocktaildb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      return Drink.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    throw Exception('Request failed');
  }
}
