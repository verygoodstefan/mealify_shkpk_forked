// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipes_repository/src/models/pairing.dart';
import 'package:the_cocktail_db_api_client/the_cocktail_db_api_client.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';

/// {@template recipes_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class RecipesRepository {
  final TheMealDbApiClient mealDbApiClient;
  final TheCocktailDbApiClient cocktailDbApiClient;

  /// {@macro recipes_repository}
  const RecipesRepository(
    this.mealDbApiClient,
    this.cocktailDbApiClient,
  );

  /// Fetches a random meal/cocktail [Pairing] of a [Meal] and [Drink].
  /// If a [Meal] is passed, that meal is paired with a [Drink] from the API.
  /// If a [Drink] is passed, that cocktail is paired with a [Meal]
  /// from the API.
  /// If both [Meal] and [Drink] are passed, then they are paired together
  /// and no call to the API is made.
  Future<Pairing> getRandomPairing({
    Meal? meal,
    Drink? drink,
  }) async {
    try {
      meal ??= await mealDbApiClient.getRandomMeal();
      drink ??= await cocktailDbApiClient.getRandomDrink();
      return Pairing(meal: meal, drink: drink);
    } catch (_) {
      rethrow;
    }
  }
}
