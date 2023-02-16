// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/src/models/pairing.dart';
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

  /// Fetches a random meal/cocktail [Pairing] of a [Meal] and [Cocktail].
  /// If a [Meal] is passed, that meal is paired with a [Cocktail] from the API.
  /// If a [Cocktail] is passed, that cocktail is paired with a [Meal]
  /// from the API.
  /// If both [Meal] and [Cocktail] are passed, then they are paired together
  /// and no call to the API is made.
  Future<Pairing> getRandomPairing({
    Meal? meal,
    Cocktail? cocktail,
  }) async {
    try {
      meal ??= await mealDbApiClient.getRandomMeal();
      cocktail ??= await cocktailDbApiClient.getRandomCocktail();
      return Pairing(meal: meal, cocktail: cocktail);
    } catch (_) {
      rethrow;
    }
  }
}

class TheCocktailDbApiClient {
  Future<Cocktail> getRandomCocktail() async {
    return Cocktail();
  }
}

class Cocktail extends Equatable {
  @override
  List<Object?> get props => [];
}
