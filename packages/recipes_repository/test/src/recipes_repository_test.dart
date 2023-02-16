// ignore_for_file: prefer_const_constructors

import 'package:mocktail/mocktail.dart';
import 'package:recipes_repository/recipes_repository.dart';
import 'package:test/test.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

class MockMealDbApiClient extends Mock implements TheMealDbApiClient {}

class MockCocktailDbApiClient extends Mock implements TheCocktailDbApiClient {}

void main() {
  group('RecipesRepository', () {
    late TheMealDbApiClient mealDbApiClient;
    late TheCocktailDbApiClient cocktailDbApiClient;
    late RecipesRepository recipesRepository;
    setUp(() {
      mealDbApiClient = MockMealDbApiClient();
      cocktailDbApiClient = MockCocktailDbApiClient();
      recipesRepository =
          RecipesRepository(mealDbApiClient, cocktailDbApiClient);
      when(() => mealDbApiClient.getRandomMeal())
          .thenAnswer((_) => Future.value(_mockMealFromApiClient));
      when(() => cocktailDbApiClient.getRandomCocktail())
          .thenAnswer((_) => Future.value(Cocktail()));
    });

    test('can be instantiated', () {
      expect(
        recipesRepository,
        isNotNull,
      );
    });

    test('fetches pairing with new meal and cocktail', () async {
      final pairing = await recipesRepository.getRandomPairing();
      expect(pairing.meal, equals(_mockMealFromApiClient));
      expect(pairing.cocktail, equals(Cocktail()));
    });

    test('fetches new cocktail to pair with existing meal', () async {
      final pairing = await recipesRepository.getRandomPairing(
        meal: _mockMealFromRepository,
      );
      expect(pairing.meal, equals(_mockMealFromRepository));
      expect(pairing.cocktail, equals(Cocktail()));
    });

    test('fetches new meal to pair with existing cocktail', () async {
      final currentCocktail = Cocktail();
      final pairing =
          await recipesRepository.getRandomPairing(cocktail: currentCocktail);
      expect(pairing.meal, equals(_mockMealFromApiClient));
      expect(pairing.cocktail, equals(currentCocktail));
    });

    test('throws exception when fetching meal fails', () async {
      when(() => mealDbApiClient.getRandomMeal()).thenThrow(Exception());
      expect(recipesRepository.getRandomPairing(), throwsException);
    });

    test('throws exception when fetching cocktail fails', () async {
      when(() => cocktailDbApiClient.getRandomCocktail())
          .thenThrow(Exception());
      expect(recipesRepository.getRandomPairing(), throwsException);
    });
  });
}

final _mockMealFromApiClient = Meal(
  idMeal: 'idMeal1',
  strMeal: 'strMeal',
  strDrinkAlternate: 'strDrinkAlternate',
  strCategory: 'strCategory',
  strInstructions: 'strInstructions',
  strMealThumb: 'strMealThumb',
  strTags: 'strTags',
  strYoutube: 'strYoutube',
  strIngredient1: 'strIngredient1',
  strIngredient2: 'strIngredient2',
  strIngredient3: 'strIngredient3',
  strIngredient4: 'strIngredient4',
  strIngredient5: 'strIngredient5',
  strIngredient6: 'strIngredient6',
  strIngredient7: 'strIngredient7',
  strIngredient8: 'strIngredient8',
  strIngredient9: 'strIngredient9',
  strIngredient10: 'strIngredient10',
  strIngredient11: 'strIngredient11',
  strIngredient12: 'strIngredient12',
  strIngredient13: 'strIngredient13',
  strIngredient14: 'strIngredient14',
  strIngredient15: 'strIngredient15',
  strIngredient16: 'strIngredient16',
  strIngredient17: 'strIngredient17',
  strIngredient18: 'strIngredient18',
  strIngredient19: 'strIngredient19',
  strIngredient20: 'strIngredient20',
  strMeasure1: 'strMeasure1',
  strMeasure2: 'strMeasure2',
  strMeasure3: 'strMeasure3',
  strMeasure4: 'strMeasure4',
  strMeasure5: 'strMeasure5',
  strMeasure6: 'strMeasure6',
  strMeasure7: 'strMeasure7',
  strMeasure8: 'strMeasure8',
  strMeasure9: 'strMeasure9',
  strMeasure10: 'strMeasure10',
  strMeasure11: 'strMeasure11',
  strMeasure12: 'strMeasure12',
  strMeasure13: 'strMeasure13',
  strMeasure14: 'strMeasure14',
  strMeasure15: 'strMeasure15',
  strMeasure16: 'strMeasure16',
  strMeasure17: 'strMeasure17',
  strMeasure18: 'strMeasure18',
  strMeasure19: 'strMeasure19',
  strMeasure20: 'strMeasure20',
  strSource: 'strSource',
  strImageSource: 'strImageSource',
  strCreativeCommonsConfirmed: 'strCreativeCommonsConfirmed',
  dateModified: DateTime.now(),
);

final _mockMealFromRepository = Meal(
  idMeal: 'idMeal2',
  strMeal: 'strMeal',
  strDrinkAlternate: 'strDrinkAlternate',
  strCategory: 'strCategory',
  strInstructions: 'strInstructions',
  strMealThumb: 'strMealThumb',
  strTags: 'strTags',
  strYoutube: 'strYoutube',
  strIngredient1: 'strIngredient1',
  strIngredient2: 'strIngredient2',
  strIngredient3: 'strIngredient3',
  strIngredient4: 'strIngredient4',
  strIngredient5: 'strIngredient5',
  strIngredient6: 'strIngredient6',
  strIngredient7: 'strIngredient7',
  strIngredient8: 'strIngredient8',
  strIngredient9: 'strIngredient9',
  strIngredient10: 'strIngredient10',
  strIngredient11: 'strIngredient11',
  strIngredient12: 'strIngredient12',
  strIngredient13: 'strIngredient13',
  strIngredient14: 'strIngredient14',
  strIngredient15: 'strIngredient15',
  strIngredient16: 'strIngredient16',
  strIngredient17: 'strIngredient17',
  strIngredient18: 'strIngredient18',
  strIngredient19: 'strIngredient19',
  strIngredient20: 'strIngredient20',
  strMeasure1: 'strMeasure1',
  strMeasure2: 'strMeasure2',
  strMeasure3: 'strMeasure3',
  strMeasure4: 'strMeasure4',
  strMeasure5: 'strMeasure5',
  strMeasure6: 'strMeasure6',
  strMeasure7: 'strMeasure7',
  strMeasure8: 'strMeasure8',
  strMeasure9: 'strMeasure9',
  strMeasure10: 'strMeasure10',
  strMeasure11: 'strMeasure11',
  strMeasure12: 'strMeasure12',
  strMeasure13: 'strMeasure13',
  strMeasure14: 'strMeasure14',
  strMeasure15: 'strMeasure15',
  strMeasure16: 'strMeasure16',
  strMeasure17: 'strMeasure17',
  strMeasure18: 'strMeasure18',
  strMeasure19: 'strMeasure19',
  strMeasure20: 'strMeasure20',
  strSource: 'strSource',
  strImageSource: 'strImageSource',
  strCreativeCommonsConfirmed: 'strCreativeCommonsConfirmed',
  dateModified: DateTime.now(),
);
