// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';
import 'package:the_meal_db_api_client/the_meal_db_api_client.dart';
import 'package:the_cocktail_db_api_client/the_cocktail_db_api_client.dart';

class Pairing extends Equatable {
  final Meal meal;
  final Drink drink;
  const Pairing({
    required this.meal,
    required this.drink,
  });

  @override
  List<Object?> get props => [meal, drink];
}
