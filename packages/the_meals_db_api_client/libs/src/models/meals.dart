import 'package:equatable/equatable.dart';

import 'meal.dart';

class Meals extends Equatable {
  const Meals(this.meals);

  factory Meals.fromJson(Map<String, dynamic> json) => _$MealsFromJson(json);

  final List<Meal> meals;

  @override
  List<Object?> get props => [meals];
}
