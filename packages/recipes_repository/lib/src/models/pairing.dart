// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:recipes_repository/recipes_repository.dart';

class Pairing extends Equatable {
  final Meal meal;
  final Cocktail? cocktail;
  const Pairing({
    required this.meal,
    this.cocktail,
  });

  @override
  List<Object?> get props => [meal, cocktail];
}
