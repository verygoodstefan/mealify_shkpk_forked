import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:the_meal_db_api_client/src/models/meals.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

import 'the_meal_db_api_client_test.mocks.dart';

// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchRandomMeal', () {
    test('returns a meal if the http call completes successfully', () async {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('http://www.themealdb.com/api/json/v1/1/random.php'),
        ),
      ).thenAnswer((_) async => http.Response(rawJsonResponse, 200));

      expect(await TheMealDbApiClient().getRandomMeal(client), isA<Meals>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      when(
        client.get(
          Uri.parse('http://www.themealdb.com/api/json/v1/1/random.php'),
        ),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(TheMealDbApiClient().getRandomMeal(client), throwsException);
    });
  });
}

const rawJsonResponse = '''
{
    "meals": [
        {
            "idMeal": "52811",
            "strMeal": "Ribollita",
            "strDrinkAlternate": null,
            "strCategory": "Vegetarian",
            "strArea": "Italian",
            "strInstructions": "Something",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/xrrwpx1487347049.jpg",
            "strTags": "Vegetarian",
            "strYoutube": "https://www.youtube.com/watch?v=BiQUYTBb6eQ",
            "strIngredient1": "Olive Oil",
            "strIngredient2": "Onion",
            "strIngredient3": "Carrot",
            "strIngredient4": "Celery",
            "strIngredient5": "Garlic",
            "strIngredient6": "Cannellini Beans",
            "strIngredient7": "Canned tomatoes",
            "strIngredient8": "Water",
            "strIngredient9": "Rosemary",
            "strIngredient10": "Thyme",
            "strIngredient11": "Kale",
            "strIngredient12": "Wholegrain Bread",
            "strIngredient13": "Red Onion",
            "strIngredient14": "Parmesan",
            "strIngredient15": "",
            "strIngredient16": "",
            "strIngredient17": "",
            "strIngredient18": "",
            "strIngredient19": "",
            "strIngredient20": "",
            "strMeasure1": "5 tablespoons",
            "strMeasure2": "1 chopped",
            "strMeasure3": "1 chopped",
            "strMeasure4": "1 stalk chopped",
            "strMeasure5": "1 tablespoon minced",
            "strMeasure6": "2 cups",
            "strMeasure7": "1",
            "strMeasure8": "4 cups",
            "strMeasure9": "1 fresh sprig",
            "strMeasure10": "1 fresh sprig",
            "strMeasure11": "1 pound chopped",
            "strMeasure12": "4 thick slices",
            "strMeasure13": "1 thinly sliced",
            "strMeasure14": "½ cup freshly grated",
            "strMeasure15": "",
            "strMeasure16": "",
            "strMeasure17": "",
            "strMeasure18": "",
            "strMeasure19": "",
            "strMeasure20": "",
            "strSource": "https://cooking.nytimes.com/recipes/1016052-ribollita",
            "strImageSource": null,
            "strCreativeCommonsConfirmed": null,
            "dateModified": null
        }
    ]
}
''';
