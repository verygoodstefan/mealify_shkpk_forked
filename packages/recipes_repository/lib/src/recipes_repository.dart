// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/src/models/pairing.dart';

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

  Future<Pairing> getPairing({
    Meal? currentMeal,
    Cocktail? currentCocktail,
  }) async {
    try {
      final meal = currentMeal ?? await mealDbApiClient.getRandomMeal();
      final cocktail =
          currentCocktail ?? await cocktailDbApiClient.getRandomCocktail();

      return Pairing(meal: meal, cocktail: cocktail);
    } catch (_) {
      rethrow;
    }
  }
}

class TheMealDbApiClient {
  Future<Meal> getRandomMeal() async {
    return Meal();
  }
}

class TheCocktailDbApiClient {
  Future<Cocktail> getRandomCocktail() async {
    return Cocktail();
  }
}

class Meal extends Equatable {
  @override
  List<Object?> get props => [];
}

class Cocktail extends Equatable {
  @override
  List<Object?> get props => [];
}
