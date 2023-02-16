// ignore_for_file: prefer_const_constructors

import 'package:mocktail/mocktail.dart';
import 'package:recipes_repository/recipes_repository.dart';
import 'package:test/test.dart';

class MockMealDbApiClient extends Mock implements TheMealsDbApiClient {}

class MockCocktailDbApiClient extends Mock implements TheCocktailDbApiClient {}

void main() {
  group('RecipesRepository', () {
    late TheMealsDbApiClient mealsDbApiClient;
    late TheCocktailDbApiClient cocktailDbApiClient;
    late RecipesRepository recipesRepository;
    setUp(() {
      mealsDbApiClient = MockMealDbApiClient();
      cocktailDbApiClient = MockCocktailDbApiClient();
      recipesRepository =
          RecipesRepository(mealsDbApiClient, cocktailDbApiClient);
      when(() => mealsDbApiClient.getRandomMeal())
          .thenAnswer((_) => Future.value(Meal()));
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
      expect(pairing.meal, equals(Meal()));
      expect(pairing.cocktail, equals(Cocktail()));
    });

    test('fetches new cocktail to pair with existing meal', () async {
      final currentMeal = Meal();
      final pairing =
          await recipesRepository.getRandomPairing(meal: currentMeal);
      expect(pairing.meal, equals(currentMeal));
      expect(pairing.cocktail, equals(Cocktail()));
    });

    test('fetches new meal to pair with existing cocktail', () async {
      final currentCocktail = Cocktail();
      final pairing =
          await recipesRepository.getRandomPairing(cocktail: currentCocktail);
      expect(pairing.meal, equals(Meal()));
      expect(pairing.cocktail, equals(currentCocktail));
    });

    test('throws exception when fetching meal fails', () async {
      when(() => mealsDbApiClient.getRandomMeal()).thenThrow(Exception());
      expect(recipesRepository.getRandomPairing(), throwsException);
    });

    test('throws exception when fetching cocktail fails', () async {
      when(() => cocktailDbApiClient.getRandomCocktail())
          .thenThrow(Exception());
      expect(recipesRepository.getRandomPairing(), throwsException);
    });
  });
}
