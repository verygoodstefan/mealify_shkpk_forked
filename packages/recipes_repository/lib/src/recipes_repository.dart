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
    Meal? meal,
    Cocktail? cocktail,
  }) async {
    try {
      if (meal == null) {
        final response = await mealDbApiClient.getRandomMeal();
        meal = response.meals[0];
      }

      if (cocktail == null) {
        final response = await cocktailDbApiClient.getRandomCocktail();
        cocktail = response.cocktails[0];
      }

      return Pairing(meal: meal, cocktail: cocktail);
    } catch (_) {
      rethrow;
    }
  }
}

class TheMealDbApiClient {
  Future<Meals> getRandomMeal() async {
    return Meals(meals: [Meal()]);
  }
}

class TheCocktailDbApiClient {
  Future<Cocktails> getRandomCocktail() async {
    return Cocktails(cocktails: [Cocktail()]);
  }
}

class Meals extends Equatable {
  final List<Meal> meals;
  const Meals({
    required this.meals,
  });

  @override
  List<Object?> get props => [meals];
}

class Cocktails extends Equatable {
  final List<Cocktail> cocktails;
  const Cocktails({
    required this.cocktails,
  });

  @override
  List<Object?> get props => [cocktails];
}

class Meal extends Equatable {
  @override
  List<Object?> get props => [];
}

class Cocktail extends Equatable {
  @override
  List<Object?> get props => [];
}
